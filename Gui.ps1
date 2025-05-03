#Init PowerShell GUi
Add-Type -AssemblyName System.Windows.Forms

#create a new form
$LocalPrintForm             = New-Object system.Windows.Forms.Form

#Define the size, title and background color
$LocalPrintForm.ClientSize      = '500,300'
$LocalPrintForm.Text            = 'Dom - GUI Example'
$LocalPrintForm.BackColor       = '#ffffff'

# Create a Title for our form. We will use a label for it. 
$Title                          = New-Object System.Windows.Forms.Label

#The Content of the lable 
$Title.Text                     = "Adding new Printer"

#Making sure the label is sized the height and length of the content
$Title.AutoSize                 = $true

# Defining the minimal width and height (not needed with autosize equalling true)
$Title.Width                    = 25 
$Title.Height                   = 10

#Position the element 
$Title.Location                 = New-Object System.Drawing.Point(20,20)

#define the front type and size
$Title.Font                     = 'Microsoft Sans Serif,13'

#other Elements 
$Description                    = New-Object System.Windows.Forms.Label
$Description.Text               = "Add a new construction site printer to your computer. Make sure you are connected to the network of the construction site."
$Description.AutoSize           = $false
$Description.Width              = 450   
$Description.Height             = 50
$Description.Location           = New-Object System.Drawing.Point(20,50)
$Description.Font               = 'Microsoft San Serif,10'

$PrinterStatus                  = New-Object System.Windows.Forms.Label
$PrinterStatus.Text             = "Status:"
$PrinterStatus.AutoSize         = $true
$PrinterStatus.Location         = New-Object System.Drawing.Point(20,115)
$PrinterStatus.Font             = 'Microsoft San Serif,10,style=Bold'

$PrinterFound                   = New-Object System.Windows.Forms.Label
$PrinterFound.Text              = "Searching for printer..."
$PrinterFound.AutoSize          = $true
$PrinterFound.Location          = New-Object System.Drawing.Point(75,115)
$PrinterFound.Font              = 'Microsoft San Serif,10'


#Creating the Combobox
$PrinterType                    = New-Object System.Windows.Forms.ComboBox
#$PrinterType.Text               = ""
$PrinterType.Width              = 170
$PrinterType.AutoSize           = $true 
#Select the default Value
$PrinterType.Location           = New-Object System.Drawing.Point(20,210)
$PrinterType.Font               = 'Microsoft Sans Serif,10'

$LocalPrintForm.Controls.Add($PrinterType)

#Add the items in the dropdown list
@('HP' , 'Lexmark') | ForEach-Object {[void] $PrinterType.Items.Add($_)}
$PrinterType.SelectedIndex      = 0

#Adding Buttons to the dialog Box
$AddPrinterBTN                  = New-Object System.Windows.Forms.Button
$AddPrinterBTN.BackColor        = "#a4ba67"
$AddPrinterBTN.Text             = "Add Printer"
$AddPrinterBTN.width            = 90
$AddPrinterBTN.height           = 30
$AddPrinterBTN.Location         = New-Object System.Drawing.Point(370,250)
$AddPrinterBTN.Font             = 'Microsoft Sans Serif,10'
$AddPrinterBTN.ForeColor        = "#ffffff"

#Cancel Button
$CancelBTN                      = New-Object System.Windows.Forms.Button
$CancelBTN.BackColor            = "#ffffff" 
$CancelBTN.Text                 = "Cancel"
$CancelBTN.Width                = 90
$CancelBTN.Height               = 30
$CancelBTN.Location             = New-Object System.Drawing.Point(260,250)
$CancelBTN.Font                 = 'Microsoft Sans Serif,10'
$CancelBTN.ForeColor            = "#000"
$CancelBTN.DialogResult         = [System.Windows.Forms.DialogResult]::Cancel

$LocalPrintForm.CancelButton    = $CancelBTN
$LocalPrintForm.Controls.Add($CancelBTN)


#YOU SHOULD BE ABLE TO ADD MORE ELEMENTS ABOVE THIS LINE 

#Add the elements to the form 
$LocalPrintForm.Controls.AddRange(@($Title,$Description,$PrinterStatus,$PrinterFound,$PrinterType,$AddPrinterBTN))

#END OF SCRIPT

#Display the form
$result = $LocalPrintForm.ShowDialog()

if ($result -eq [System.Windows.Forms.DialogResult]::Cancel)
{
    Write-Output "User clicked cancel"
}



