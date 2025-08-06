# iOS-MVVM

A modern SwiftUI-based Pokemon exploration app built with MVVM architecture, featuring user authentication and Pokemon list and details data display.

## 🏗️ Architecture

This project follows the **Model-View-ViewModel (MVVM)** architectural pattern with a separation of concerns:

- **Models**: Data structures representing Pokemon, user data, and API responses
- **Views**: SwiftUI views for user interface
- **ViewModels**: Business logic and state management
- **Services**: Data fetching and authentication services
- **Utils**: Utility classes and helpers

## 📱 Features

- **User Authentication**: Firebase and REST API login options
- **Pokemon List**: Browse Pokemon with pagination and loading states
- **Pokemon Details**: Detailed view with stats, abilities, moves, and types
- **Multiple Data Sources**: Fetch for both REST API and GraphQL (Switchable)

## Inspiration

This project architecture is inspired by the principles described in the book:

**iOS Architecture Patterns: MVC, MVP, MVVM, VIPER, and VIP in Swift**  
by Raúl Ferrer García  

![Clean Architecture: A Craftsman's Guide to Software Structure and Design](https://m.media-amazon.com/images/I/61Bdi6tA6ZL._SY522_.jpg)

## 🙏 Acknowledgments

- [PokeAPI](https://pokeapi.co/) for Pokemon data
- [Firebase](https://firebase.google.com/) for authentication services

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

