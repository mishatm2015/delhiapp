# South Indian Food Delivery App

A beautiful, modern Flutter application for South Indian food delivery in Delhi NCR, built based on a Figma design with Material Design 3.

## Features

- 🎨 Modern Material Design 3 UI based on Figma design
- 📱 Responsive design for all screen sizes
- 🧭 Bottom navigation with Shop, Catalog, and Profile
- 🛍️ Shop screen with location bar, search, and product browsing
- 🏆 Best Sellers section with product cards
- 🗂️ Shop by category grid layout
- 👤 User profile management for food delivery
- ✨ Beautiful gradients, shadows, and South Indian themed colors
- 🎨 Custom color scheme matching the design

## Screenshots

The app includes:
- **Shop Screen**: Location bar, search, hero banner for "MOTTA (EGG) PUFFS", best sellers, categories, and promotional banners
- **Catalog Screen**: Product catalog browsing (coming soon)
- **Profile Screen**: User profile with food delivery specific options

## Design Features

Based on the Figma design, the app includes:
- Purple location bar with "Deliver to Home" and Delhi NCR address
- Search bar with "Q Search for products" placeholder
- Hero banner featuring South Indian food items
- Best Sellers section with product cards showing ratings and prices
- Category grid with South Indian food categories
- Informational banners about authentic South Indian taste
- Bottom navigation with shopping bag, grid, and profile icons

## Getting Started

### Prerequisites

- Flutter SDK (3.8.1 or higher)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or physical device

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd delhiapp
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Development

- **Hot Reload**: Press `r` in the terminal or use the hot reload button in your IDE
- **Hot Restart**: Press `R` in the terminal or use the hot restart button in your IDE
- **Debug Mode**: The app runs in debug mode by default

## Project Structure

```
lib/
├── main.dart              # Main app entry point
├── config/                # App configuration and theme
│   └── app_config.dart    # Colors, theme, and styling constants
├── screens/               # Screen widgets
│   ├── home_screen.dart   # Main navigation container
│   ├── shop_screen.dart   # Shop screen with products and categories
│   ├── catalog_screen.dart # Product catalog (coming soon)
│   └── profile_screen.dart # User profile and settings
├── widgets/               # Reusable widgets
│   ├── product_card.dart  # Product display card
│   ├── category_card.dart # Category grid item
│   └── custom_button.dart # Custom button component
├── models/                # Data models
│   └── user_model.dart    # User data structure
└── services/              # Business logic
    └── auth_service.dart  # Authentication service
```

## Customization

### Colors
The app uses a South Indian themed color scheme:
- **Primary**: Purple (`#6B46C1`) - Main brand color
- **Secondary**: Red (`#E53E3E`) - Accent and promotional elements
- **Accent**: Orange/Yellow (`#F6AD55`) - Highlights and call-to-action

### Fonts
The app is configured to use the Poppins font family for a modern, clean look.

### Icons
All icons are from the Material Icons library, customized to match the food delivery theme.

## Adding New Features

1. **New Screen**: Create a new screen widget and add it to the `_screens` list in `HomeScreen`
2. **New Navigation Item**: Add a new `BottomNavigationBarItem` in the `HomeScreen`
3. **Custom Widgets**: Create reusable widgets in the `widgets/` directory
4. **State Management**: For complex state, consider adding state management solutions like Provider or Riverpod

## Dependencies

- `flutter`: Core Flutter framework
- `cupertino_icons`: iOS-style icons

## Building for Production

### Android
```bash
flutter build apk --release
```

### iOS
```bash
flutter build ios --release
```

### Web
```bash
flutter build web --release
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions, please open an issue in the repository.

---

**Note**: This app is built based on a specific Figma design for a South Indian food delivery service. The design includes location-based delivery, product browsing, and user profile management specifically tailored for food delivery in Delhi NCR.
