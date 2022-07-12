import { Router } from "express";
import logger from "../utils/logger.js";
import loggerUtils from "../utils/loggerUtils.js";
import PersonajesServices from "../services/PersonajesServices.js";


const router = Router();

router.get('/', async (req, res) =>{
    try {
        const personajes = await PersonajesServices.GetAllCharacters();
        logInfo(personajes.recordset);
        res.send(personajes.recordsets[0]);
    } catch (error) {
        logError(error.toString())
        res.status(400).send(error.toString());
    }
});

router.post('/', async (req, res) => {
    try {
        const personaje = req.body;
        const result = await PersonajesServices.CreateNewCharacter(personaje);
        logInfo(result.recordset);
        res.send(result.recordset[0].testID);
    } catch (error) {
        logError(error.toString())
        res.status(400).send(error.toString());
    }
});

router.delete('/id', async (req, res) => {
    try {
        const result = await PersonajesServices.DeleteCharacterByID(req.params.id);
        logInfo(result.recordset);
        res.send(result.recordset[0].testID);
    } catch (error) {
        logError(error.toString())
        res.status(400).send(error.toString());
    }
});

router.put(':id', async(req, res) =>{
    try {
        const result = await PersonajesServices.UpdateCharacter(req.params.id, req.body.personaje)
        logInfo(result.recordset);
        res.send(result.recordset[0].testID);
    } catch (error) {
        logError(error.toString())
        res.status(400).send(error.toString());
    }
})

export default router;
