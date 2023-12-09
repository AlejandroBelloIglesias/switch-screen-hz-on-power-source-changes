Dim battery_status, prev_status
prev_status = CheckBattery
Set colMonitoredEvents = GetObject("winmgmts:\\.\root\cimv2")._
    ExecNotificationQuery("Select * from Win32_PowerManagementEvent")
Do
    Set strLatestEvent = colMonitoredEvents.NextEvent
    If strLatestEvent.EventType = 10 Then
        battery_status = CheckBattery
        If battery_status <> prev_status Then
            If battery_status = 1 Then
                ' Desenchufado
                ExecuteCommand "C:\Windows\System32\QRes.exe /r:60"
            ElseIf battery_status = 2 Then
                ' Enchufado
                ExecuteCommand "C:\Windows\System32\QRes.exe /r:144"
            End If
        End If
    End If
    prev_status = battery_status
Loop

Function CheckBattery
    Dim oWMI, items, item
    Set oWMI = GetObject("winmgmts:\\.\root\cimv2")
    Set items = oWMI.ExecQuery("Select * from Win32_Battery",,48)
    For Each item in items
        If item.BatteryStatus = 1 Then
            CheckBattery = 1
            Exit Function
        ElseIf item.BatteryStatus = 2 then
        CheckBattery = 2
            Exit Function
        End If
    Next
End Function

Sub ExecuteCommand(command)
    Dim objShell
    Set objShell = WScript.CreateObject("WScript.Shell")
    objShell.Run command, 0, true
    Set objShell = Nothing
End Sub