import { Router } from "express";
import logger from "../utils/logger.js";
import PersonajesServices from "../services/PersonajesServices.js";


const router = Router();

router.get('/', async (req, res) =>{
    try {
        const personajes = await PersonajesServices.GetAllCharacters();
        logger.log({
            level: 'error',
            message: personajes.recordset
        })
        res.send(personajes.recordsets[0]);
    } catch (error) {
        logger.log({
            level: 'error',
            message: error.toString()
        })
        res.status(400).send(error.toString());
    }
});

router.post('/', async (req, res) => {
    try {
        const personaje = req.body;
        const result = await PersonajesServices.CreateNewCharacter(personaje);
        logger.log({
            level: 'info',
            message: result.recordset,
        });
        res.send(result.recordset[0].testID);
    } catch (error) {
        logger.log({
            level: 'error',
            message: error.toString()
        })
        res.status(400).send(error.toString());
    }
});

export default router;
