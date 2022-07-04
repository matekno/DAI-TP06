import { createLogger, format, transports } from 'winston';
const { splat, combine, timestamp, printf } = format;

const logFormat = printf(({ timestamp, level, message }) => {
    return `${timestamp};${level};${JSON.stringify(message)}}`;
});

const logger = createLogger({
    format: combine(
        format.timestamp({
            format: 'YYYY-MM-DD HH:mm:ss'
        }),
        timestamp(),
        format.json(),
        format.colorize(),
        logFormat
    ),
    transports: [
        new transports.Console(),
        new transports.File({ filename: 'combined.log' })
    ]
});

export default logger;