import config from "../config/dbconfig.js";
import sql from "mssql";

class DBUtils {
    static select = async (table) => {
        let query = "SELECT * FROM " + table;
        let pool = await sql.connect(config);
        return await pool.request().query(query);
    };

    static insert = async (table, cols, valuesString) => {
        let query = `INSERT INTO ${table} (${cols}) VALUES (${valuesString}) SELECT inserted.Id`;
        let pool = await sql.connect(config);
        let result = await pool.request().query(query);
        return result;
    };

    static insertGetUuid = async (table, cols, valuesString) => {
        let query = `DECLARE @MyTableVar table([testID] [uniqueidentifier]); INSERT INTO ${table} (${cols}) OUTPUT INSERTED.[ID] INTO @MyTableVar VALUES (${valuesString}) SELECT [testID] FROM @MyTableVar;`;
        let pool = await sql.connect(config);
        let result = await pool.request().query(query);
        return result;
    }

    static delete = async (table, whereCondition) => {
        let query = `DELETE FROM ${table} WHERE ${whereCondition.key} = ${whereCondition.value}`;
        let pool = await sql.connect(config);
        let result = await pool.request().query(query);
        return result;
    };

    static update = async (table, valuesString, whereCondition) => {
        let query = `UPDATE ${table} SET ${valuesString} WHERE ${whereCondition.key} = ${whereCondition.value}`;
        let pool = await sql.connect(config);
        let result = await pool.request().query(query);
        return result;
    };

    static where = async (table, valuesString) => {
        let query = `SELECT * FROM ${table} WHERE ${valuesString};`;
        let pool = await sql.connect(config);
        let result = await pool.request().query(query);
        return await result;
    };
};

export default DBUtils;