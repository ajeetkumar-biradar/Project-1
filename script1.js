$(document).ready(function() {
    // Initialize DataTable with options
    $('#datatable').DataTable({
      dom: 'Bfrtip', // Specify the layout of DataTable with buttons
      buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print', // Include the export options you want
        {
          extend: 'word', // Word export option
          title: 'DataTable Report', // Document title
          text: 'Word', // Button text
        }
      ]
    });
  });
  