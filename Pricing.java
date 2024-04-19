package myBean;

import java.math.BigDecimal;

public class Pricing {
    // attributes
    private BigDecimal roomDoubleFull;
    private BigDecimal roomDoubleFullHiCap;
    private BigDecimal roomQueen;
    private BigDecimal roomQueenHiCap;
    private BigDecimal roomDoubleQueen;
    private BigDecimal roomDoubleQueenHiCap;
    private BigDecimal roomKing;
    private BigDecimal roomKingHiCap;

    // no-arg constructor
    public Pricing() {
        super();
        // Initialize all prices according to the specification
        roomDoubleFull = new BigDecimal("120.75");
        roomDoubleFullHiCap = new BigDecimal("157.50");
        roomQueen = new BigDecimal("120.75");
        roomQueenHiCap = new BigDecimal("157.50");
        roomDoubleQueen = new BigDecimal("120.75");
        roomDoubleQueenHiCap = new BigDecimal("157.50");
        roomKing = new BigDecimal("120.75");
        roomKingHiCap = new BigDecimal("157.50");
    }

    // getters and setters
    public BigDecimal getRoomDoubleFull() {
        return roomDoubleFull;
    }

    public void setRoomDoubleFull(BigDecimal roomDoubleFull) {
        this.roomDoubleFull = roomDoubleFull;
    }

    public BigDecimal getRoomDoubleFullHiCap() {
        return roomDoubleFullHiCap;
    }

    public void setRoomDoubleFullHiCap(BigDecimal roomDoubleFullHiCap) {
        this.roomDoubleFullHiCap = roomDoubleFullHiCap;
    }

    public BigDecimal getRoomQueen() {
        return roomQueen;
    }

    public void setRoomQueen(BigDecimal roomQueen) {
        this.roomQueen = roomQueen;
    }

    public BigDecimal getRoomQueenHiCap() {
        return roomQueenHiCap;
    }

    public void setRoomQueenHiCap(BigDecimal roomQueenHiCap) {
        this.roomQueenHiCap = roomQueenHiCap;
    }

    public BigDecimal getRoomDoubleQueen() {
        return roomDoubleQueen;
    }

    public void setRoomDoubleQueen(BigDecimal roomDoubleQueen) {
        this.roomDoubleQueen = roomDoubleQueen;
    }

    public BigDecimal getRoomDoubleQueenHiCap() {
        return roomDoubleQueenHiCap;
    }

    public void setRoomDoubleQueenHiCap(BigDecimal roomDoubleQueenHiCap) {
        this.roomDoubleQueenHiCap = roomDoubleQueenHiCap;
    }

    public BigDecimal getRoomKing() {
        return roomKing;
    }

    public void setRoomKing(BigDecimal roomKing) {
        this.roomKing = roomKing;
    }

    public BigDecimal getRoomKingHiCap() {
        return roomKingHiCap;
    }

    public void setRoomKingHiCap(BigDecimal roomKingHiCap) {
        this.roomKingHiCap = roomKingHiCap;
    }
}
