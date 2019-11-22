package com.sxf.cms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sxf.cms.dao.ChannelMapper;
import com.sxf.cms.domain.Channel;
import com.sxf.cms.service.ChannelService;

@Service
public class ChannelServiceImpl implements ChannelService {
	@Resource
	private ChannelMapper channelMapper;

	public List<Channel> selects() {
		return channelMapper.selects();
	}

}
