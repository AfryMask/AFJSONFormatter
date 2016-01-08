VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "JSON格式化工具"
   ClientHeight    =   5490
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10845
   LinkTopic       =   "Form1"
   Picture         =   "Form1.frx":0000
   ScaleHeight     =   5490
   ScaleWidth      =   10845
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command1 
      Caption         =   "Run"
      Height          =   375
      Left            =   4560
      TabIndex        =   1
      Top             =   5040
      Width           =   1455
   End
   Begin VB.TextBox Text1 
      Height          =   5055
      Left            =   -240
      MultiLine       =   -1  'True
      ScrollBars      =   2  'Vertical
      TabIndex        =   0
      Text            =   "Form1.frx":13F4
      Top             =   -240
      Width           =   11055
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Dim str As String

str = Text1.Text
Dim str3 As String

Dim key As Integer


For i = 1 To Len(str)

    st = Mid(str, i, 1)
    
    If st = "{" Then
        str3 = str3 & st
        str3 = str3 & vbCrLf
        key = key + 1
        str3 = str3 & Space(key)
        
    ElseIf st = "[" Then
        str3 = str3 & st
        str3 = str3 & vbCrLf
        key = key + 1
        str3 = str3 & Space(key)
        
    ElseIf st = "," Then
        str3 = str3 & st
        str3 = str3 & vbCrLf
        str3 = str3 & Space(key)
        
    ElseIf st = "}" Then
        str3 = str3 & vbCrLf
        key = key - 1
        str3 = str3 & Space(key)
        str3 = str3 & st
        
    ElseIf st = "]" Then
        str3 = str3 & vbCrLf
        key = key - 1
        str3 = str3 & Space(key)
        str3 = str3 & st
        
    Else
        str3 = str3 & st
    End If
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
Next

Text1.Text = str3

End Sub

Private Sub Form_Resize()
Text1.Left = 0
Text1.Top = 0
Text1.Height = Form1.Height - 1400
Text1.Width = Form1.Width - 100
Command1.Height = 600
Command1.Top = Text1.Height + 200
Command1.Width = 2500
Command1.Left = Form1.Width / 2 - 1250





End Sub

