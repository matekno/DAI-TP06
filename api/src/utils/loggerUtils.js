import logger from "./logger.js"
class loggerUtils{
    static logError = (m) => {
        logger.log({
            level: 'error',
            message: m
        })
    }
    
    static logInfo = (m) => {
        logger.log({
            level: 'info',
            message: m
        })
    }
} 

export default loggerUtils;

