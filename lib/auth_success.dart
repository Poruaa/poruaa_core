const String authSuccessHtml = r"""<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Authentication Successful</title>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Lato', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #ffffff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
        }

        .container {
            background: #ffffff;
            border-radius: 24px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
            padding: 48px;
            text-align: center;
            max-width: 480px;
            width: 100%;
            animation: slideUp 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 2px solid #000000;
            position: relative;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .success-icon {
            width: 80px;
            height: 80px;
            background: #000000;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 32px;
            animation: pulse 2s infinite;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            position: relative;
        }

        .success-icon::before {
            content: '';
            position: absolute;
            top: -3px;
            left: -3px;
            right: -3px;
            bottom: -3px;
            background: #000000;
            border-radius: 50%;
            opacity: 0.2;
            animation: ripple 2s infinite;
        }

        @keyframes ripple {
            0% { transform: scale(1); opacity: 0.2; }
            100% { transform: scale(1.3); opacity: 0; }
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.03); }
            100% { transform: scale(1); }
        }

        .checkmark {
            width: 40px;
            height: 40px;
            position: relative;
            z-index: 1;
        }

        .checkmark::after {
            content: '';
            position: absolute;
            left: 50%;
            top: 50%;
            width: 20px;
            height: 10px;
            border: solid white;
            border-width: 0 0 4px 4px;
            transform: translate(-50%, -60%) rotate(-45deg);
        }

        h1 {
            color: #000000;
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 16px;
            letter-spacing: -0.5px;
        }

        .subtitle {
            color: #333333;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 32px;
            font-weight: 400;
        }

        .button-group {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-bottom: 32px;
        }

        .platform-button {
            background: #000000;
            color: white;
            border: 2px solid #000000;
            padding: 16px 32px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            position: relative;
            overflow: hidden;
        }

        .platform-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.15), transparent);
            transition: left 0.5s;
        }

        .platform-button:hover::before {
            left: 100%;
        }

        .platform-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        }

        .platform-button:active {
            transform: translateY(0);
        }

        .platform-icon {
            width: 20px;
            height: 20px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }

        .close-button {
            background: #ffffff;
            color: #000000;
            border: 2px solid #000000;
            padding: 12px 24px;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .close-button:hover {
            background: #000000;
            color: #ffffff;
            transform: translateY(-1px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .footer {
            margin-top: 24px;
            color: #666666;
            font-size: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .footer-icon {
            width: 16px;
            height: 16px;
            background: #000000;
            border-radius: 50%;
        }

        .spinner {
            display: none;
            width: 20px;
            height: 20px;
            border: 2px solid #f3f3f3;
            border-top: 2px solid #000000;
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin: 0 auto 16px;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .loading .spinner {
            display: block;
        }

        .loading .platform-button,
        .loading .close-button {
            opacity: 0.7;
            cursor: not-allowed;
        }

        .platform-info {
            background: #f8f8f8;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 16px;
            margin-bottom: 24px;
            font-size: 14px;
            color: #333333;
        }

        .brand-section {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-bottom: 24px;
        }

        .brand-icon {
            width: 32px;
            height: 32px;
            background: #000000;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 700;
            font-size: 16px;
        }

        .brand-text {
            font-size: 18px;
            font-weight: 700;
            color: #000000;
            letter-spacing: 0.5px;
        }

        @media (max-width: 480px) {
            .container {
                padding: 32px 24px;
                margin: 16px;
            }
            
            h1 {
                font-size: 24px;
            }
            
            .subtitle {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="brand-section">
            <div class="brand-icon">P</div>
            <div class="brand-text">Poruaa</div>
        </div>
        
        <div class="success-icon">
            <div class="checkmark"></div>
        </div>
        
        <h1>Authentication Successful!</h1>
        <p class="subtitle">
            You have been successfully authenticated with Google. 
            Choose how you'd like to continue:
        </p>
        
        <div class="platform-info">
            <strong>💡 Tip:</strong> You can now return to your application or continue in your current browser.
        </div>
        
        <div class="button-group">
            <button class="platform-button" onclick="openWithPlatform()">
                <div class="platform-icon">🖥️</div>
                <span id="platform-text">Open with Desktop App</span>
            </button>
        </div>
        
        <div class="spinner"></div>
        <button class="close-button" onclick="closeWindow()">
            Close Window
        </button>
        
        <div class="footer">
            <div class="footer-icon"></div>
            <p>Powered by Poruaa</p>
        </div>
    </div>

    <script>
        // Detect platform and update button text
        function detectPlatform() {
            const userAgent = navigator.userAgent.toLowerCase();
            const platformText = document.getElementById('platform-text');
            
            if (userAgent.includes('mac')) {
                platformText.textContent = 'Open with macOS App';
                return 'macos';
            } else if (userAgent.includes('win')) {
                platformText.textContent = 'Open with Windows App';
                return 'windows';
            } else if (userAgent.includes('linux')) {
                platformText.textContent = 'Open with Linux App';
                return 'linux';
            } else {
                platformText.textContent = 'Open with Desktop App';
                return 'desktop';
            }
        }

        function openWithPlatform() {
            const platform = detectPlatform();
            const container = document.querySelector('.container');
            
            // Add loading state
            container.classList.add('loading');
            
            // Create a custom URL scheme based on platform
            const customScheme = `poruaa://app/`;
            
            // Try to open the custom scheme
            window.location.href = customScheme;
            
            // Fallback: try to close the window after a delay
            setTimeout(() => {
                window.close();
            }, 2000);
        }

        function closeWindow() {
            const button = document.querySelector('.close-button');
            const container = document.querySelector('.container');
            
            // Add loading state
            container.classList.add('loading');
            button.textContent = 'Closing...';
            
            // Close the window after a short delay
            setTimeout(() => {
                window.close();
            }, 500);
        }

        // Initialize platform detection
        detectPlatform();

        // Auto-close after 8 seconds if user doesn't interact
        setTimeout(() => {
            const container = document.querySelector('.container');
            if (!container.classList.contains('loading')) {
                closeWindow();
            }
        }, 8000);
    </script>
</body>
</html>
""";
