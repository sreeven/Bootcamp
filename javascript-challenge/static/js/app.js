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


// function buildTable(data) {
//     // First, clear out any existing data
//     tbody.html("");
  
//     // Next, loop through each object in the data
//     // and append a row and cells for each value in the row
//     data.forEach((dataRow) => {
//       // Append a row to the table body
//       const row = tbody.append("tr");

//     });
//   }