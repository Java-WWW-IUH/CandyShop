/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sv.iuh.project.service;

import java.util.List;
import sv.iuh.project.model.OrderDetail;

/**
 *
 * @author Thanh Hoai
 */
public interface StatisticalService {

    public Long totalUserShop();

    public Long totalProductBrand();

    public Long totalOrderDetail();
    public Long totalProduct();
    public List<OrderDetail> newFiveOrder();
}
