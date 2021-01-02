// from data.js
var tableData = data;

// table
var body = d3.select("tbody");

// build the table

function buildTable(data) {

    // add row
    data.forEach((row) => {
        tRow = body.append("tr");
        tRow.text(Object.datetime);

        // add column
        Object.values(row).forEach((value) => {
            cell = tRow.append("td");
            cell.text(value);
        }
        );
    }
    );

}

buildTable(data);


