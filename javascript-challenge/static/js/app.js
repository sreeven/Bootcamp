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

function handleClick {

    // get input
    input = d3.select(".form-control").property("value")


    // filter data

    // function filterData(data) {

    // }

}