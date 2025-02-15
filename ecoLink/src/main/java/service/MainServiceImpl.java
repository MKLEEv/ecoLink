package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MainDAO;
import dto.BannerDTO;
import dto.BoardDTO;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	MainDAO maindao;

	public MainServiceImpl(MainDAO maindao) {
		this.maindao = maindao;
	}

	@Override
	public int getMemberCount() {
		return maindao.getMemberCount();
	}

	@Override
	public int getEnterCount() {
		return maindao.getEnterCount();
	}

	@Override
	public int getBoardCount() {
		return maindao.getBoardCount();
	}

	@Override
	public List<BannerDTO> getAllBanners() {
		return maindao.getAllBanners();
	}

	@Override
	public List<BoardDTO> getShareBoardList() {
		return maindao.getShareBoardList();
	}
}
