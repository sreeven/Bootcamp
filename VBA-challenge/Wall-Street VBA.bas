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

    Worksheets(j).Activate

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

            If openPrice > 0 Then
                percentChange = Round((closingPrice - openPrice) / openPrice * 100, 2)
                Cells(index, 11).Value = percentChange
            End If

            If yearChange < 0 Then
                Cells(index, 10).Interior.ColorIndex = 3
            ElseIf yearChange > 0 Then
                Cells(index, 10).Interior.ColorIndex = 4
            End If
            
            index = index + 1
        End If

    Next i

    'Greatest Increase labels

    Range("P1").Value = "Ticker"
    Range("Q1").Value = "Value"
    Range("O2").Value = "Greatest % Increase"
    Range("O3").Value = "Greatest % Decrease"
    Range("O4").Value = "Greatest Total Volume"

    'Find Greatest % Increase

    Dim greatestIncrease as Double

    For a = 3 To numRows
        greatestIncrease = Cells(2,9).Value

        if Cells(a,9).Value > greatestIncrease Then
            greatestIncrease = Cells(a,9).Value
        End if


    'Find Greatest % Decrease

    Dim greatestDecrease as Double

    For a = 3 To numRows
        greatestDecrease = Cells(2,9).Value
        
        if Cells(a,9).Value < greatestDecrease Then
            greatestDecrease = Cells(a,9).Value
        End if

    'Find Greatest Total Volume

    Dim greatestTotal as Double

    For a = 3 To numRows
        greatestTotal = Cells(2,11).Value
        
        if Cells(a,11).Value > greatestTotal Then
            greatestTotal = Cells(a,11).Value
        End if


    'Fill Cells




Next j



End Sub
