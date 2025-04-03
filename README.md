<<<<<<< HEAD
# assignments

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

#ScreenShots

![image alt](https://github.com/naveenmenda3/DriversOrderList/blob/main/Screenshot%202025-04-03%20095406.png?raw=true)

![image alt](https://github.com/naveenmenda3/DriversOrderList/blob/main/Screenshot%202025-04-03%20095431.png)
![image alt](https://github.com/naveenmenda3/DriversOrderList/blob/main/Screenshot%202025-04-03%20095502.png)
![image alt](https://github.com/naveenmenda3/DriversOrderList/blob/main/Screenshot%202025-04-03%20095502.png)


# Driver Order List Screen

## Overview
The **Driver Order List Screen** is a Flutter widget designed for delivery drivers. It displays a list of assigned delivery orders for the day with key order details and sorting functionalities.

## Features
- **Displays today's date prominently**.
- **Fetches and displays a mock list of delivery orders** assigned to the driver.
- **Uses large, easily tappable List Item Cards** for accessibility.
- **Each order card shows:**
  - Customer Name
  - Address Snippet (e.g., Area/Street)
  - Order Status ("Pending", "In Progress", "Delivered" with color-coded tags/icons)
  - Delivery time slot or sequence number
- **Sorting options:**
  - Sort by Sequence/Time Slot
  - Sort by Status
- **Handles different list states:**
  - Loading state
  - Empty state ("No orders assigned")
  - Orders displayed state
- **Order details navigation:**
  - Tapping an order item navigates to a placeholder "Driver Order Details" screen (accepts Order ID/object)
- **UI Elements use ThemeData** for consistency.
- **All text is localized** for internationalization.

## Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/driver-order-list.git
   ```
2. Navigate to the project directory:
   ```sh
   cd driver-order-list
   ```
3. Install dependencies:
   ```sh
   flutter pub get
   ```
4. Run the app:
   ```sh
   flutter run
   ```

## Usage
- The **Driver Order List Screen** will load and display the assigned orders for the day.
- Use the sorting options to organize the list as needed.
- Tap on an order to navigate to its details screen.

## Folder Structure
```
lib/
├── main.dart                # Entry point
├── screens/
│   ├── driver_order_list.dart  # Main order list screen
│   ├── driver_order_details.dart  # Order details screen
├── widgets/
│   ├── order_card.dart      # UI component for individual orders
│   ├── sorting_buttons.dart # Sorting chips/buttons
├── models/
│   ├── order_model.dart     # Order data model
├── utils/
│   ├── theme.dart           # ThemeData and styling
│   ├── localization.dart    # Localization helper
```

## Contributing
1. Fork the repository.
2. Create a feature branch:
   ```sh
   git checkout -b feature-name
   ```
3. Commit changes:
   ```sh
   git commit -m "Add feature description"
   ```
4. Push to your branch:
   ```sh
   git push origin feature-name
   ```
5. Open a Pull Request.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

---

**Author:** Your Name  
**GitHub:** [yourusername](https://github.com/yourusername)


# DriversOrderList
>>>>>>> 2054cc665deabc0919ef87f7c807e6ac1caa923d
