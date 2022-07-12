import { Router } from "express";
import logger from "../utils/logger.js";
import loggerUtils from "../utils/loggerUtils.js";
import PersonajesServices from "../services/PersonajesServices.js";


const router = Router();

router.get('/', async (req, res) =>{
    try {
        const personajes = await PersonajesServices.GetAllCharacters();
        loggerUtils.logInfo(personajes.recordset);
        res.send(personajes.recordsets[0]);
    } catch (error) {
        loggerUtils.logError(error.toString())
        res.status(400).send(error.toString());
    }
});

router.post('/', async (req, res) => {
    try {
        const personaje = req.body;
        const result = await PersonajesServices.CreateNewCharacter(personaje);
        loggerUtils.logInfo(result);
        res.send({nuevoId: result});
    } catch (error) {
        loggerUtils.logError(error.toString())
        res.status(400).send(error.toString());
    }
});

router.delete('/:id', async (req, res) => {
    try {
        const result = await PersonajesServices.DeleteCharacterByID(req.params.id);
        loggerUtils.logInfo(result);
        res.send(result);
    } catch (error) {
        loggerUtils.logError(error.toString())
        res.status(400).send(error.toString());
    }
});

router.put('/:id', async(req, res) =>{
    try {
        const result = await PersonajesServices.UpdateCharacter(req.params.id, req.body)
        console.log(result);
        loggerUtils.logInfo(result);
        res.send(result);
    } catch (error) {
        loggerUtils.logError(error.toString())
        res.status(400).send(error.toString());
    }
})

export default router;
