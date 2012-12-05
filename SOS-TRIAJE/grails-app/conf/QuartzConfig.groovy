
quartz {
    autoStartup = true
    jdbcStore = false
    waitForJobsToCompleteOnShutdown = true
}

environments {
    test {
        quartz {
            autoStartup = false
        }
    }
    
    cargarData{
        quartz {
            autoStartup = false
        }        
    }
}
