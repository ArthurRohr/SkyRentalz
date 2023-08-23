import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      "disable": [
        function(date) {
          console.log(date)
          // Disable if the date is within a specific range (e.g., from @booking.check_in to @booking.check_out)
          const checkInDate = new Date("2023-08-25");
          const checkOutDate = new Date("2023-08-28");
          //console.log(checkInDate)
          //console.log(checkOutDate)

          var element = document.getElementById('my-element');
          var bookings = element.getAttribute('data-all-bookings');

          var jsonArray = JSON.parse(bookings);
          jsonArray.forEach(function(item) {
           // console.log(item.check_in);
          //console.log(item.check_out)

            if (date >= item.check_in && date <= item.check_out)
              return true;
          })



          // Disable if the date is in the past
          const today = new Date();
          today.setHours(0, 0, 0, 0); // Set time to the start of the day

          if (date < today) {
            return true;
          }

          return false; // Enable the date if none of the conditions are met
        }
      ]
    })

  }
}
