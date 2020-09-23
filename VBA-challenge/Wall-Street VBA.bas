Sub stocks():

Dim index As Integer
Dim ticker As String
Dim total As Double
Dim volume As Double
Dim numRows As Long
Dim openPrice As Double
Dim closingPrice As Double
Dim yearChange As Double
Dim percentChange As Double
Dim worksheetCount as Integer

worksheetCount = Worksheets.Count

For j=1 To worksheetCount


    Cells(1, 9).Value = "Ticker"
    Cells(1, 10).Value = "Yearly Change"
    Cells(1, 11).Value = "Percent Change"
    Cells(1, 12).Value = "Stock Volume"

    numRows = Cells(Rows.Count, "A").End(xlUp).Row

    index = 2

    For i = 2 To numRows

        If Cells(i, 1).Value <> Cells(i - 1, 1).Value Then
            ticker = Cells(i, 1).Value
            Cells(index, 9).Value = ticker
            index = index + 1
            i = i + 1
        End If

    Next i

    i = 2
    index = 1

    For i = 2 To numRows

        If Cells(i, 1).Value = Cells(i - 1, 1).Value Then
            volume = Cells(i, 7)
            total = total + volume
            Cells(index, 12).Value = total
        Else
            total = 0
            index = index + 1
            
        End If

    Next i

    i = 2
    index = 2

    For i = 2 To numRows

        If Cells(i, 1).Value <> Cells(i - 1, 1).Value Then
            openPrice = Cells(i, 3).Value
        End If
        
        If Cells(i, 1).Value <> Cells(i + 1, 1).Value Then
            closingPrice = Cells(i, 6).Value
        
        yearChange = closingPrice - openPrice
        Cells(index, 10).Value = yearChange
        percentChange = Round((closingPrice - openPrice) / openPrice * 100, 2)
        Cells(index, 11).Value = percentChange
        If yearChange < 0 Then
            Cells(index, 10).Interior.ColorIndex = 3
        Else
            Cells(index, 10).Interior.ColorIndex = 4
        End If
        
        index = index + 1
        End If

    Next i

Next j



End Sub
