import DBUtils from "../utils/DBUtils.js";
import { v4 as uuidv4 } from 'uuid';


class PersonajesServices {
    static GetAllCharacters = async () => {
        return (await DBUtils.select('PERSONAJES'));
    };

    static CreateNewCharacter = async (personaje) => {
        const res = await DBUtils.insert("PERSONAJES", "[IMAGEN_URL],[NOMBRE],[EDAD],[PESO],[HISTORIA]", `'${personaje.IMAGEN_URL}', '${personaje.NOMBRE},', '${personaje.EDAD}', '${personaje.PESO}', '${personaje.HISTORIA}'`);
        const myObj = res.recordset[0]
        console.log(Object.values(myObj)[0]);
        return(Object.values(myObj)[0]);
    }

    static DeleteCharacterByID = async (id) => {

        const res = await DBUtils.delete("PERSONAJES", { key: "ID", value: id });
        if (res.rowsAffected > 0) {
            return "DELETED SUCCESFULLY";
        }
        else {
            return "ERROR :C"
        }

    }
    static UpdateCharacter = async (id, c) => {
        const res = await DBUtils.update("PERSONAJES", `IMAGEN_URL = '${c.IMAGEN_URL}', NOMBRE = '${c.NOMBRE}', EDAD = '${c.EDAD}', PESO = '${c.PESO}', HISTORIA = '${c.HISTORIA}'`, { key: "ID", value: id });
        if (res.rowsAffected > 0) {
            return "MODIFIED SUCCESFULLY";
        }
        else {
            return "ERROR :C"
        }
    }
}

export default PersonajesServices