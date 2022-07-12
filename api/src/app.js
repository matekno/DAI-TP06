import express from "express";
import loggerUtils from "./utils/loggerUtils.js";
import CAVRouter from "./controllers/PersonajesController.js";
import cors from 'cors'
import bp from 'body-parser';

const app = express();
const port = 3000;

app.use(cors());
app.use(bp.json());
app.use(bp.urlencoded({ extended: true }));

app.use("/api/characters", CAVRouter);

app.listen(port, () => {
    loggerUtils.logInfo(`Started in port ${port}`);
})