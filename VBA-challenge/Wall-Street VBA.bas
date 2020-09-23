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
    Dim greatestIncreaseTicker as String
    greatestIncrease = Cells(2,10).Value

    For a = 3 To numRows

        if Cells(a,10).Value > greatestIncrease Then
            greatestIncrease = Cells(a,10).Value
            greatestIncreaseTicker = Cells(a,9).Value
            Range("P2").Value = greatestIncreaseTicker
            Range("Q2").Value = greatestIncrease
        End if

    Next a


    'Find Greatest % Decrease

    Dim greatestDecrease as Double
    Dim greatestDecreaseTicker as String
    greatestDecrease = Cells(2,10).Value

    For b = 3 To numRows
        
        if Cells(b,10).Value < greatestDecrease Then
            greatestDecrease = Cells(b,10).Value
            greatestDecreaseTicker = Cells(b,9).Value
            Range("P3").Value = greatestDecreaseTicker
            Range("Q3").Value = greatestDecrease
        End if

    Next b

    'Find Greatest Total Volume

    Dim greatestTotal as Double
    Dim greatestTotalTicker as String
    greatestTotal = Cells(2,12).Value

    For c = 3 To numRows
        
        if Cells(c,12).Value > greatestTotal Then
            greatestTotal = Cells(c,12).Value
            greatestTotalTicker = Cells(c,9).Value
            Range("P4").Value = greatestTotalTicker
            Range("Q4").Value = greatestTotal
        End if
        
    Next c

    Worksheets(j).Columns("A:Z").AutoFit

Next j


End Sub
