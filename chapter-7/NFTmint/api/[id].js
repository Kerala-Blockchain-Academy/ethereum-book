const MetadataSet = require("../Metadata.json")


module.exports = async(req,res)=>{
    const {id} = req.query;
    res.json(JSON.parse(JSON.stringify(MetadataSet[id])));

}