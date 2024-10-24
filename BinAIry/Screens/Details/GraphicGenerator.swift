import Foundation

struct GraphicGenerator {
    
    static func generateGraphicCode(ticker: String) -> String {
        """
        <!DOCTYPE html>
        <html>
        <head>
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <style>
                body, html {
                    margin: 0;
                    padding: 0;
                    height: 100%;
                    width: 100%;
                    overflow: hidden;
                    background-color: #0F111E;
                }
                .tradingview-widget-container {
                    background-color: #0F111E;
                    position: absolute;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    height: 100%;
                    width: 100%;
                }
            </style>
        </head>
        <body>
            <div class="tradingview-widget-container">
                <div id="tradingview_\(ticker)"></div>
                <script type="text/javascript" src="https://s3.tradingview.com/tv.js"></script>
                <script type="text/javascript">
                new TradingView.widget({
                "width": "100%",
                                  "height": "100%",
                  "symbol": "\(ticker)",
                  "interval": "D",
                  "timezone": "Etc/UTC",
                  "theme": "dark",
                  "style": "1",
                  "locale": "en",
                  "toolbar_bg": "#f1f3f6",
                  "hide_top_toolbar": true, // Скрываем верхнюю панель
                  "hide_legend": true,      // Скрываем легенду
                  "save_image": false,
                  "studies": [],
                  "hidevolume": true,       // Скрываем объём
                  "container_id": "tradingview_\(ticker)"
                });
                </script>
            </div>
        </body>
        </html>
        """
    }
    
}
