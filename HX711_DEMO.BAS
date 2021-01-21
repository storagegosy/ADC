$regfile = "8052.dat"
$crystal = 12000000

Config Lcdpin = Pin , Db4 = P2.4 , Db5 = P2.5 , Db6 = P2.6,
Config Lcdpin = Pin , Db7 = P2.7 , E = P2.0 , Rs = P2.2
P2.1 = 0
Dim Count As Long
Dim I As Byte
Dim Hx711_read As Long
Dim Hx711 As String * 10
Dim Datafix As Integer

Adsk Alias P1.1                                               ' use pin D.4 as output sck
Addo Alias P1.0                                               ' use pin D.5 as input Dataout

Cls
Upperline
Lcd "DEMO HX711 READER"
Do
  Addo = 1
  Adsk = 0
  Count = 0

  While Addo = 1
  Wend

  For I = 1 To 24
    Adsk = 1
    Shift Count , Left , 1
    Adsk = 0
    If Addo = 1 Then Incr Count
  Next
  Adsk = 1
  Count = Count                                               
  Adsk = 0

  Hx711_read = Count
  Hx711 = Str(hx711_read)
Lowerline
Lcd "nilai = " ; Hx711 ; "  "

Waitms 200

Loop
End
