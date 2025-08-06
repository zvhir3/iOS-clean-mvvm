# iOS-Clean-MVVM

A modern SwiftUI-based app built with a **Clean MVVM** architecture, featuring user authentication and Pokémon list and stats view.

## 🏗️ Architecture

This project applies the **Clean MVVM** pattern — combining the simplicity of MVVM with the layered separation of Clean Architecture.

- **Data**: 
  - `Models` → Network/response models  
  - `Repositories` → Implementations for REST, GraphQL, Firebase, etc.
- **Domain**: 
  - `Repositories` → Protocols defining contracts for data access  
  - `UseCases` → Business logic (application rules)
- **Presentation**: 
  - `Views` → SwiftUI screens and UI components  
  - `ViewModels` → State management, input/output binding
- **Shared**:
  - `Configs` → Source configuration (active data source choices)  
  - `Factories` → Repository factories for dependency injection  
  - `Utils` → Reusable helpers (e.g., `AuthChecker`)  

This layered approach ensures:
- Clear **separation of concerns**  
- Easy **switching between data sources** (REST ↔ GraphQL, Firebase ↔ REST)  
- Better **testability** and **scalability**

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


