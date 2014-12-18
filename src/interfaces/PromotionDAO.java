package interfaces;

import java.util.List;

import entities.Promotion;

public interface PromotionDAO {
	//ajoutation
	public void addPromotion(String optInit, String optName, String specInit, String specName, String year, int begYear);   
	public void addPromotion(Promotion p);
	
	//recherche
	public Promotion findPromotionById(long id);
	public List<Promotion> findPromotionByOptionInitial(String name);
	public List<Promotion> findPromotionBySpecialiteInitial(String name);
	public List<Promotion> findPromotionByBegYear(int year);
	public List<Promotion> findPromotionByOptBegYear(String opt, int year);
	public List<Promotion> findAllPromotions();
	public List<Promotion> findAllPromotionsSortedByYear();
	
	//modification
	public void updatePromotionOptInitial(long id, String optionInitial);
	public void updatePromotionOptNom(long id, String optionNom);
	public void updatePromotionSpecInitial(long id, String specialiteInitial);
	public void updatePromotionSpecNom(long id, String speciaNom);
	public void updatePromotionYear(long id, String year);
	public void updatePromotionStartYear(long id, int year);
	
	//supprimation
	public void deletePromotion(long id);
}
