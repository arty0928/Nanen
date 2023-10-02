package project.nanuen;

import jakarta.annotation.PostConstruct;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import project.nanuen.domain.member.Member;
import project.nanuen.domain.member.MemberRepository;

@Component
@RequiredArgsConstructor
public class TestDataInit {

    private final MemberRepository memberRepository;

    /**
     * 테스트용 데이터 추가
     */
    @PostConstruct
    public void init() {
        Member member = new Member();
        member.setLoginId("nam");
        member.setPassword("bowoo");
        member.setName("남보우");

        memberRepository.save(member);
    }
}
