package com.whit.crm.pojo;

public class FrmCertificateForExcel extends FrmCertificate {
    private boolean error;

    private String errorMsg;

    public boolean isError() {
        return error;
    }

    public void setError(boolean error) {
        this.error = error;
    }

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
}
