BEGIN {}
{print fetchAFTimestamp($29)," ",$1, "[topic:", $19,"]", "[env:",removeComma($26),"]","[messageId:",fetchUniqueID($31),"]","[DB_Time:",fetchCreationDate($33),"]", "[AF_Timestamp:", fetchAFTimestamp($29),"]", "[onPrem_TimeStamp:",$3,"]"}
END {}

#Removes Comma from the end
function removeComma(STRING){
    main_string = STRING

    split(main_string, array, ",")
    return array[1]
}

#Removes Quotes from the string value
function removeQuotes(STRING){
    main_string = STRING
    
    main_string = substr(main_string,2,length(main_string)-2)
    return main_string
}

#Fetch Activity Feeds TimeStamp
function fetchAFTimestamp(STRING){
    main_string = STRING

    split(main_string, array, ":")
    split(array[4], tArray, ",")
    return(removeQuotes(tArray[1]))
}

#Fetch Unique Id of the message
function fetchUniqueID(STRING){
    main_string = STRING
    
    split(main_string, array, ":")
    split(array[4], uArray, ",")
    return removeQuotes(uArray[1])
}

#Fetch Bet Creation Date
function fetchCreationDate(STRING){
    main_string = STRING

    split(main_string,array,",")
    split(array[8],cArray,"\"")
    split(cArray[4],dbTArray,"T")
    split(dbTArray[2],tArray,"+")
    return(tArray[1])
}
