import { Router } from "express";
import loggerUtils from "../utils/loggerUtils.js";
import PAVService from "../services/PAVService.js";

const router = Router();

router.get('/', async (req, res) => {
    try {
        const PAVs = await PAVService.GetAllPAVs();
        loggerUtils.logInfo(PAVs.recordset);
        res.send(PAVs.recordsets[0]);
    } catch (error) {
        loggerUtils.logError(error.toString())
        res.status(400).send(error.toString());
    }
})

router.post('/', async (req, res) => {
    try {
        const pav = req.body
        const result = await PAVService.CreatePAV(pav);
        loggerUtils.logInfo(result);
        res.send({ nuevoId: result });
    } catch (error) {
        loggerUtils.logError(error.toString())
        res.status(400).send(error.toString());
    }
})

router.delete('/:id', async (req, res) =>{
    try {
        const result = await PAVService.DeletePAV(req.params.id);
        loggerUtils.logInfo(result);
        res.send(result);
    } catch (error) {
        loggerUtils.logError(error.toString())
        res.status(400).send(error.toString());
    }
})

router.get('/dev', async (req, res) => {
    try {
        const result = await PAVService.GetPAVWithCharacters("Los Simpson"); // no andan bien los params, pero hardocded va como pina
        loggerUtils.logInfo(result);
        res.send(result);
    } catch (error) {
        loggerUtils.logError(error.toString())
        res.status(400).send(error.toString());
    }
})

export default router;