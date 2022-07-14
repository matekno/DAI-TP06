import express from "express";
import loggerUtils from "./utils/loggerUtils.js";
import PersonajesRouter from "./controllers/PersonajesController.js";
import PAVRouter from "./controllers/PAVController.js";
import cors from 'cors'
import bp from 'body-parser';

const app = express();
const port = 3000;

app.use(cors());
app.use(bp.json());
app.use(bp.urlencoded({ extended: true }));

app.use("/api/characters", PersonajesRouter);
app.use("/api/pav", PAVRouter)

app.listen(port, () => {
    loggerUtils.logInfo(`Started in port ${port}`);
})