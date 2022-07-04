import { Router } from "express";
import logger from "../utils/logger.js";
import CAVServices from "../services/PersonajesServices.js";


const router = Router();

router.get('/', async (req, res) =>{
    try {
        const personajes = await CAVServices.GetAllCharacters();
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
})

export default router;
