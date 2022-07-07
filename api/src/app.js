import express from "express";
import logger from './utils/logger.js'
import CAVRouter from "./controllers/PersonajesController.js";
import cors from 'cors'
import bp from 'body-parser';
import * as Config from "./config/firebase_config.js"

import { initializeApp } from 'firebase/app';
import 'firebase/auth';
import 'firebase/firestore';

import * as url from 'url';
import path from "path";

const __filename = url.fileURLToPath(import.meta.url);
const __dirname = url.fileURLToPath(new URL('.', import.meta.url));



initializeApp(Config.firebaseConfig)

const app = express();
const port = 3000;

const logOnFinish = (req, res, next) => {
    // console.log('antes: ' + new Date().toISOString());
    //console.log(req.method);
    next();
    logger.log({
        level: 'info',
        message: res.locals.respuesta
    })
    // console.log('Despues' + new Date().toISOString());
    // console.log('usuario:' + req.usuario);
    //req.params.usuario = 'mati';
}

app.use(cors());
app.use(bp.json());
app.use(bp.urlencoded({ extended: true }));
app.use(logOnFinish);

app.use("/api/characters", CAVRouter);

app.use(express.static("public"))

app.use('/pub',express.static(path.join(__dirname, 'public')));

app.get("/", async (req, res) => {
    res.sendFile(path.join(__dirname, './public', 'index.html'));
})

app.listen(port, () => {
    logger.log({
        level: 'info',
        message: `Started in port ${port}`
    })
})