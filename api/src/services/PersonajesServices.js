import DBUtils from "../utils/DBUtils.js";
import { v4 as uuidv4 } from 'uuid';


class PersonajesServices {
    static GetAllCharacters = async () => {
        return (await DBUtils.select('PERSONAJES'));
    };

    static CreateNewCharacter = async (personaje) =>{
        return (await DBUtils.insert("PERSONAJES", "[IMAGEN_URL],[NOMBRE],[EDAD],[PESO],[HISTORIA]", `'${personaje.IMAGEN_URL}', '${personaje.NOMBRE},', '${personaje.EDAD}', '${personaje.PESO}', '${personaje.HISTORIA}'`));
    }

    static DeleteCharacterByID = async (id) => {
        return (await DBUtils.delete("PERSONAJES", {key: "ID", value: id}));
    }
    static UpdateCharacter = async (id, c) =>{
        return (await DBUtils.update("PERSONAJES", `IMAGEN_URL = '${c.IMAGEN_URL}', NOMBRE = '${c.NOMBRE}', EDAD = '${c.EDAD}', PESO = '${c.PESO}', HISTORIA = '${c.HISTORIA}'`, {key: "ID", value: id}))
    }
}

export default PersonajesServices