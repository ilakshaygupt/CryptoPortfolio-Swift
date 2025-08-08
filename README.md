# CryptoTask 📱

A modern iOS cryptocurrency portfolio and exchange application built with SwiftUI. CryptoTask provides a sleek, dark-themed interface for tracking crypto investments, viewing analytics, and managing exchange transactions.

## 🚀 Features

### 📊 Analytics Dashboard
- **Portfolio Overview**: Real-time portfolio value display with currency formatting
- **Interactive Charts**: Custom-built chart component with touch interactions
- **Time Range Selection**: Multiple time periods (1d, 1w, 1m, 3m, 6m, 1y)
- **Recent Transactions**: Transaction history with visual indicators
- **Crypto Cards**: Individual cryptocurrency performance cards

### 💱 Exchange Functionality
- **Balance Display**: Current balance with change indicators
- **Transaction Management**: Add, view, and track exchange transactions
- **Send/Receive Actions**: Quick action buttons for transfers
- **Transaction History**: Detailed list of recent exchange activities

### 🎨 Modern UI/UX
- **Dark Theme**: Elegant black background with gradient accents
- **Smooth Animations**: Fluid transitions and interactive elements
- **Custom Components**: Tailored UI components for crypto-specific needs

## 📱 Screenshots


<img width="245" height="516" alt="Screenshot 2025-08-08 at 10 24 25 PM" src="https://github.com/user-attachments/assets/c575300c-9d5e-4b15-8930-ef2250fe4d8e" />
<img width="245" height="517" alt="Screenshot 2025-08-08 at 10 24 53 PM" src="https://github.com/user-attachments/assets/4a804d8a-d508-40ac-8421-96edbddcf85b" />
<img width="236" height="509" alt="Screenshot 2025-08-08 at 10 25 22 PM" src="https://github.com/user-attachments/assets/a090357e-aa0b-456b-9fea-78d8137be07a" />
<img width="237" height="515" alt="Screenshot 2025-08-08 at 10 23 57 PM" src="https://github.com/user-attachments/assets/03dcc4f1-aa4e-44cb-94fd-41f7e3fb5fd3" />
<img width="242" height="517" alt="Screenshot 2025-08-08 at 10 24 42 PM" src="https://github.com/user-attachments/assets/752aa52b-fd28-48cc-a587-d7df1acc0df9" />
<img width="240" height="515" alt="Screenshot 2025-08-08 at 10 23 17 PM" src="https://github.com/user-attachments/assets/926d0325-c645-47d0-8406-b38c8084081e" />
<img width="247" height="519" alt="Screenshot 2025-08-08 at 10 23 43 PM" src="https://github.com/user-attachments/assets/99b35b09-4277-4b3e-bd39-dd5838abb767" />
<img width="241" height="517" alt="Screenshot 2025-08-08 at 10 24 11 PM" src="https://github.com/user-attachments/assets/1325bdd7-b2df-411c-9bbd-8945455bb163" />

https://github.com/user-attachments/assets/46de2359-324c-486a-bace-19a01785e48a


### Main Features:
- **Analytics Tab**: Portfolio overview with interactive charts
- **Exchange Tab**: Balance display and transaction management
- **Record Tab**: Transaction recording interface (placeholder)
- **Wallet Tab**: Wallet management interface (placeholder)

## 🛠️ Setup Instructions

### Prerequisites
- **Xcode 16.3+** (Latest version recommended)
- **iOS 18.4+** (Minimum deployment target)
- **macOS** (for iOS development)
- **Apple Developer Account** (for device testing)

### Installation Steps

1. **Clone the Repository**
   ```bash
   git clone https://github.com/ilakshaygupt/CryptoPortfolio-Swift
   cd CryptoTask
   ```

2. **Open in Xcode**
   ```bash
   open CryptoTask.xcodeproj
   ```

3. **Install Dependencies**
   - The project uses Swift Package Manager
   - Dependencies will be automatically resolved when you open the project
   - Main dependency: **NavKit** (v1.0.4) for navigation

4. **Build and Run**
   - Select your target device (iPhone Simulator or physical device)
   - Press `Cmd + R` or click the Run button
   - The app should build and launch successfully

### Project Structure

```
CryptoTask/
├── App/
│   └── CryptoTaskApp.swift          # Main app entry point
├── Models/
│   ├── Transaction.swift            # Transaction data model
│   ├── ExchangeTransaction.swift    # Exchange transaction model
│   └── AppTheme.swift              # Theme and styling
├── ViewModels/
│   ├── MainViewModel.swift          # Main app state management
│   ├── ChartViewModel.swift         # Chart data and interactions
│   ├── ExchangeViewModel.swift      # Exchange functionality
│   ├── PortfolioViewModel.swift     # Portfolio data
│   └── TransactionViewModel.swift   # Transaction management
├── Views/
│   ├── MainView.swift              # Main app container
│   ├── ChartView.swift             # Interactive chart component
│   ├── ExchangeScreen.swift        # Exchange interface
│   ├── PortfolioHeaderView.swift   # Portfolio overview
│   ├── BottomNavBar.swift          # Navigation bar
│   └── [Other UI components...]
└── Assets.xcassets/                # App icons and colors
```

## 🔧 Dependencies

- **NavKit** (v1.0.4): My Custom navigation framework
  - Source: https://github.com/ilakshaygupt/NavKit
  - Used for: Navigation between screens and modal presentations

## 📋 Known Limitations & Areas for Improvement

### Current Limitations
1. **Mock Data**: The app currently uses hardcoded mock data for:
   - Chart data points
   - Transaction history
   - Portfolio values
   - Exchange rates

2. **Incomplete Features**:
   - **Record Tab**: Currently shows placeholder text
   - **Wallet Tab**: Currently shows placeholder text
   - **Real-time Data**: No live cryptocurrency price feeds
   - **Authentication**: No user authentication system

3. **Data Persistence**:
   - No local data storage (Core Data, UserDefaults, etc.)
   - No cloud synchronization
   - All data is lost when app is closed

### Recommended Improvements

#### High Priority
1. **API Integration**:
   - Integrate with cryptocurrency APIs (CoinGecko, CoinMarketCap)
   - Real-time price updates
   - Historical data for charts

2. **Data Persistence**:
   - Implement Core Data for local storage
   - UserDefaults for settings and preferences
   - CloudKit for cross-device sync

3. **Authentication**:
   - User registration and login
   - Secure data storage
   - Multi-user support

#### Medium Priority
4. **Enhanced Features**:
   - Complete Record and Wallet tabs
   - Push notifications for price alerts
   - Portfolio performance analytics
   - Export functionality

5. **UI/UX Enhancements**:
   - Light theme option
   - Accessibility improvements
   - iPad support
   - Widget support

#### Low Priority
6. **Advanced Features**:
   - Trading functionality
   - News integration
   - Social features
   - Advanced charting tools

## 🐛 Troubleshooting

### Common Issues

1. **Build Errors**:
   - Ensure Xcode version is 16.3 or higher
   - Clean build folder (`Cmd + Shift + K`)
   - Reset package caches in Xcode

2. **Dependency Issues**:
   - Delete `DerivedData` folder
   - Reset package caches: File → Packages → Reset Package Caches
   - Rebuild project

3. **Simulator Issues**:
   - Reset simulator: Device → Erase All Content and Settings
   - Try different iOS versions




**Lakshay Gupta**
- Created: August 6, 2025
- Last Updated: August 8, 2025

**Note**: This is a demonstration project showcasing SwiftUI development skills and modern iOS app architecture. For production use, additional security, testing, and real API integrations would be required.
