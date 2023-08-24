import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      "disable": [
        function(date) {
          // Disable if the date is within a specific range (e.g., from @booking.check_in to @booking.check_out)
          const element = document.getElementById('my-element');
          const bookings = element.getAttribute('data-all-bookings');

          const bookingArray = JSON.parse(bookings);
          const bookingRange = bookingArray.some((item)=>{

            const checkIn = new Date(item.check_in)
            checkIn.setHours(0,0,0)
            const checkOut = new Date(item.check_out)
            checkOut.setHours(0,0,0)
            date.setHours(0,0,0)

            return date >= checkIn && date <= checkOut;
          })

          if(bookingRange == true) {
              return true
          }
          

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
