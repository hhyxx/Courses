PROCEDURE GET_POSITION_LIST(P_DPT_ID       IN NUMBER ---部门ID--2510
                             ,
                              P_QUERY_STRING IN VARCHAR2 --职位名称
                             ,
                              P_RESULT       OUT RESULTREF) IS
  
  BEGIN
    OPEN P_RESULT FOR
      SELECT HF.POSITION_ID, HF.NAME
        FROM HR_ALL_POSITIONS_F HF
       WHERE HF.ORGANIZATION_ID = P_DPT_ID
         AND SYSDATE BETWEEN NVL(HF.EFFECTIVE_START_DATE, SYSDATE) AND
             NVL(HF.EFFECTIVE_END_DATE, SYSDATE)
         AND (HF.NAME IS NULL OR
             HF.NAME LIKE '%' || NVL(P_QUERY_STRING, '') || '%');
  END;
