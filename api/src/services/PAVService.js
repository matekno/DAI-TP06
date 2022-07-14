import DBUtils from "../utils/DBUtils.js";

class PAVService {
    static GetAllPAVs = async () => {
        return (await DBUtils.select('PRODUCCION_AUDIOVISUAL'));
    }
    static CreatePAV = async (pav) => {
        const res = await DBUtils.insert("PRODUCCION_AUDIOVISUAL", "[IMAGEN],[TITULO],[FECHA_CREACION]", `'${pav.IMAGEN}', '${pav.TITULO},', '${pav.FECHA_CREACION}'`);
        const myObj = res.recordset[0]
        console.log(Object.values(myObj)[0]);
        return (Object.values(myObj)[0]);
    }
    static DeletePAV = async (id) =>{
        const res = await DBUtils.delete("PRODUCCION_AUDIOVISUAL", {key: "ID", value: id});
        if (res.rowsAffected > 0) {
            return "DELETED SUCCESFULLY";
        }
        else {
            return "ERROR :C"
        }
    }
    static GetPAVWithCharacters = async (pav) =>{
        const res = await DBUtils.ExecOneParam("spGetCharactersAndProduction", {name: 'prod', value: pav})
        const a = {
            SHOW: res.recordsets[0],
            PERSONAJES: res.recordsets[1]
        }
        return a;
    }
}

export default PAVService;