function Setup {
    # We can't properly manage visual effects through the registry. Just run the application to configure.
    LogProcess "Choose the performance mode. Set 'Show shadows under mouse pointer', 'Show thumbnails instead of icons', 'Smooth edges of screen fonts'."

    Start-Process $env:windir\system32\SystemPropertiesPerformance.exe -Wait
}
