import DBUtils from "../utils/DBUtils.js";
import { v4 as uuidv4 } from 'uuid';


class PersonajesServices {
    static GetAllCharacters = async () => {
        return (await DBUtils.select('PERSONAJES'));
    };

    static CreateNewCharacter = async (personaje) =>{
        return (await DBUtils.insertGetUuid("PERSONAJES", "[ID],[IMAGEN_URL],[NOMBRE],[EDAD],[PESO],[HISTORIA]", `'${uuidv4()}', '${personaje.IMAGEN_URL}', '${personaje.NOMBRE},', '${personaje.EDAD}', '${personaje.PESO}', '${personaje.HISTORIA}'`));
    }
}

export default PersonajesServices