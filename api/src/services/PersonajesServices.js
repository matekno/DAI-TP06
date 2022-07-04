import DBUtils from "../utils/DBUtils.js";

class CAVServices {
    static GetAllCharacters = async () => {
        return (await DBUtils.select('PERSONAJES'));
    };
}

export default CAVServices