package sample.jsp;


import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReadingListController{
	ReadingListRepository readingListRepository;
	@Autowired
	public ReadingListController(ReadingListRepository readingListRepository){
		this.readingListRepository=readingListRepository;
	}

	@RequestMapping(value="/{reader}",method=RequestMethod.GET)
	public String readerbooks(@PathVariable("reader") String reader,Model model){
		List<Book> readingList=readingListRepository.findByReader(reader);
		if(readingList != null){
			model.addAttribute("books",readingList);
		}
		model.addAttribute("book", new Book());
		return "readingList";
	}
	
	@RequestMapping(value="/{reader}",method=RequestMethod.POST)
	public String addToReadingList(@PathVariable("reader") String reader,Book book){
		book.setReader(reader);
		System.out.println(reader);
		readingListRepository.save(book);
		return "redirect:/{reader}";
	}
}
