"""Einfaches Inventur-Fenster für Desktop-Nutzung.

Das Script kann mit Python ausgeführt oder per PyInstaller zu einer
Windows-Exe gepackt werden. Es bietet eine kleine Oberfläche, um
Artikel, Menge, Standort und Notizen zu erfassen und die Liste als
CSV-Datei zu exportieren.
"""

from __future__ import annotations

import csv
from dataclasses import dataclass
from pathlib import Path
import tkinter as tk
from tkinter import ttk, messagebox, filedialog


@dataclass
class InventoryItem:
    name: str
    quantity: int
    location: str
    notes: str


class InventoryApp(tk.Tk):
    def __init__(self) -> None:
        super().__init__()
        self.title("Bestandsaufnahme")
        self.geometry("640x420")
        self.resizable(False, False)

        self._items: list[InventoryItem] = []

        self._build_form()
        self._build_table()
        self._build_actions()

    def _build_form(self) -> None:
        form_frame = ttk.LabelFrame(self, text="Neuer Eintrag")
        form_frame.pack(fill=tk.X, padx=12, pady=10)

        ttk.Label(form_frame, text="Artikel").grid(row=0, column=0, padx=6, pady=6, sticky=tk.W)
        ttk.Label(form_frame, text="Menge").grid(row=0, column=1, padx=6, pady=6, sticky=tk.W)
        ttk.Label(form_frame, text="Standort").grid(row=0, column=2, padx=6, pady=6, sticky=tk.W)
        ttk.Label(form_frame, text="Notizen").grid(row=0, column=3, padx=6, pady=6, sticky=tk.W)

        self.name_var = tk.StringVar()
        self.quantity_var = tk.StringVar(value="1")
        self.location_var = tk.StringVar()
        self.notes_var = tk.StringVar()

        ttk.Entry(form_frame, textvariable=self.name_var, width=24).grid(row=1, column=0, padx=6, pady=6)
        ttk.Entry(form_frame, textvariable=self.quantity_var, width=10).grid(row=1, column=1, padx=6, pady=6)
        ttk.Entry(form_frame, textvariable=self.location_var, width=18).grid(row=1, column=2, padx=6, pady=6)
        ttk.Entry(form_frame, textvariable=self.notes_var, width=28).grid(row=1, column=3, padx=6, pady=6)

        add_button = ttk.Button(form_frame, text="Hinzufügen", command=self.add_item)
        add_button.grid(row=1, column=4, padx=12, pady=6)

    def _build_table(self) -> None:
        table_frame = ttk.Frame(self)
        table_frame.pack(fill=tk.BOTH, expand=True, padx=12)

        columns = ("name", "quantity", "location", "notes")
        self.tree = ttk.Treeview(table_frame, columns=columns, show="headings", height=10)
        self.tree.heading("name", text="Artikel")
        self.tree.heading("quantity", text="Menge")
        self.tree.heading("location", text="Standort")
        self.tree.heading("notes", text="Notizen")

        self.tree.column("name", width=170)
        self.tree.column("quantity", width=70, anchor=tk.CENTER)
        self.tree.column("location", width=120)
        self.tree.column("notes", width=240)

        scrollbar = ttk.Scrollbar(table_frame, orient=tk.VERTICAL, command=self.tree.yview)
        self.tree.configure(yscrollcommand=scrollbar.set)

        self.tree.grid(row=0, column=0, sticky="nsew")
        scrollbar.grid(row=0, column=1, sticky="ns")

        table_frame.columnconfigure(0, weight=1)
        table_frame.rowconfigure(0, weight=1)

    def _build_actions(self) -> None:
        action_frame = ttk.Frame(self)
        action_frame.pack(fill=tk.X, padx=12, pady=10)

        ttk.Button(action_frame, text="Ausgewählten Eintrag löschen", command=self.delete_selected).pack(side=tk.LEFT)
        ttk.Button(action_frame, text="Liste leeren", command=self.clear_items).pack(side=tk.LEFT, padx=8)
        ttk.Button(action_frame, text="Als CSV speichern", command=self.export_csv).pack(side=tk.RIGHT)

    def add_item(self) -> None:
        name = self.name_var.get().strip()
        if not name:
            messagebox.showwarning("Eingabe prüfen", "Bitte einen Artikelnamen eingeben.")
            return

        try:
            quantity = int(self.quantity_var.get())
            if quantity < 1:
                raise ValueError
        except ValueError:
            messagebox.showwarning("Eingabe prüfen", "Menge muss eine Zahl größer oder gleich 1 sein.")
            return

        item = InventoryItem(
            name=name,
            quantity=quantity,
            location=self.location_var.get().strip(),
            notes=self.notes_var.get().strip(),
        )
        self._items.append(item)
        self._append_to_table(item)
        self._reset_form()

    def _append_to_table(self, item: InventoryItem) -> None:
        self.tree.insert("", tk.END, values=(item.name, item.quantity, item.location, item.notes))

    def _reset_form(self) -> None:
        self.name_var.set("")
        self.quantity_var.set("1")
        self.location_var.set("")
        self.notes_var.set("")

    def delete_selected(self) -> None:
        selected_item = self.tree.selection()
        if not selected_item:
            messagebox.showinfo("Auswahl", "Kein Eintrag ausgewählt.")
            return

        index = self.tree.index(selected_item[0])
        self.tree.delete(selected_item[0])
        try:
            del self._items[index]
        except IndexError:
            # Sollte nur bei inkonsistenter Auswahl auftreten
            self._items = [InventoryItem(*self.tree.item(item, "values")) for item in self.tree.get_children()]

    def clear_items(self) -> None:
        if messagebox.askyesno("Bestätigen", "Alle Einträge wirklich löschen?"):
            self.tree.delete(*self.tree.get_children())
            self._items.clear()

    def export_csv(self) -> None:
        if not self._items:
            messagebox.showinfo("Export", "Keine Daten zum Speichern vorhanden.")
            return

        file_path = filedialog.asksaveasfilename(
            title="CSV speichern",
            defaultextension=".csv",
            filetypes=[("CSV-Datei", "*.csv")],
        )
        if not file_path:
            return

        self._write_csv(Path(file_path))
        messagebox.showinfo("Export", f"Datei gespeichert: {file_path}")

    def _write_csv(self, path: Path) -> None:
        with path.open("w", newline="", encoding="utf-8") as csvfile:
            writer = csv.DictWriter(csvfile, fieldnames=["Artikel", "Menge", "Standort", "Notizen"])
            writer.writeheader()
            for item in self._items:
                writer.writerow({
                    "Artikel": item.name,
                    "Menge": item.quantity,
                    "Standort": item.location,
                    "Notizen": item.notes,
                })


def main() -> None:
    app = InventoryApp()
    app.mainloop()


if __name__ == "__main__":
    main()
