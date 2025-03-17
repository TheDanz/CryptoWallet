# CryptoWallet

CryptoWallet is a iOS application designed to view cryptocurrency prices and quotes

## Requirements

- iOS 15 or later

## Functionality

- Authorization screen (login / password verification)
- List of cryptocurrencies (sortable table list)
- Detailed information about the coin (data about a specific cryptocurrency)

## Architecture

This project follows the MVVM (Model-View-ViewModel) architecture pattern, which promotes a clean separation of concerns in the app's codebase. The components are structured as follows:

- Model: The model is represented by the networking layer that handles data fetching from external cryptocurrency APIs

- ViewModel: The ViewModel acts as an intermediary between the Model and the View. It makes network requests to fetch cryptocurrency data and processes this data before passing it to the View

- View: The View consists of the user interface components in the app, such as view controllers and UI elements. It binds to the ViewModel to receive updates and reflects any changes in the data

## Installation

1. Clone the repository to your local machine using:
   
   `git clone https://github.com/thedanz/CryptoWallet.git`
   
2. Open the project in Xcode.

3. Build and run the application on a simulator or a physical device.

## Screenshots

Here are some screenshots of the app:

<img src="https://github.com/user-attachments/assets/f5f1f65a-de02-4c32-99a6-e8eff96e0293" width="262" height="568">
<img src="https://github.com/user-attachments/assets/e9832dbf-f2b9-464c-86bd-c954bf7077e7" width="262" height="568">
