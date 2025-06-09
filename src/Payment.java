package src;

public class Payment {
    private int paymentId;
    private double amount;
    private String paymentMethod;
    private int transactionId;
    private int bookingId;



    // SUCCESS lub FAILED
    private boolean paymentStatus;

    static private int id =0;

    public Payment(double amount, String paymentMethod, int transactionId, int bookingId){
        this.paymentId = ++id;
        this.amount = amount;
        this.transactionId = transactionId;
        this.paymentMethod = paymentMethod;
        this.bookingId = bookingId;
    }

    //GETTERS
    public int getPaymentId() {return paymentId;}
    public int getBookingId() {return bookingId;}
    public boolean isPaymentStatus() {return paymentStatus;}
    public double getAmount() {return amount;}
    public String getPaymentMethod() {return paymentMethod;}
    public int getTransactionId() {return transactionId;}

    //SETTERS
    public void setPaymentId(int paymentId) {this.paymentId = paymentId;}
    public void setAmount(double amount) {this.amount = amount;}
    public void setPaymentMethod(String paymentMethod) {this.paymentMethod = paymentMethod;}
    public void setTransactionId(int transactionId) {this.transactionId = transactionId;}
    public void setBookingId(int bookingId) {this.bookingId = bookingId;}
    public void setPaymentStatus(boolean paymentStatus) {this.paymentStatus = paymentStatus;}
}
