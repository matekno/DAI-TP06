import express from "express";
import logger from './utils/logger.js'
import CAVRouter from "./controllers/PersonajesController.js";
import cors from 'cors'
import bp from 'body-parser';

const app = express();
const port = 3000;

const logOnFinish = (req, res, next) =>{
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
app.use(bp.urlencoded({ extended: true }))
app.use(logOnFinish);

app.use("/api/characters", CAVRouter);


app.listen(port, () =>{
    logger.log({
        level: 'info',
        message: `Started in port ${port}`
    })
})