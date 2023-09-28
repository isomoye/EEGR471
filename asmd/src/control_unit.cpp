#include <backends/cxxrtl/cxxrtl.h>

#if defined(CXXRTL_INCLUDE_CAPI_IMPL) || \
    defined(CXXRTL_INCLUDE_VCD_CAPI_IMPL)
#include <backends/cxxrtl/cxxrtl_capi.cc>
#endif

#if defined(CXXRTL_INCLUDE_VCD_CAPI_IMPL)
#include <backends/cxxrtl/cxxrtl_vcd_capi.cc>
#endif

using namespace cxxrtl_yosys;

namespace cxxrtl_design {

// \top: 1
// \src: control_unit.v:1.1-58.10
struct p_control__unit : public module {
	// \src: control_unit.v:1.46-1.54
	/*output*/ value<1> p_addshift;
	// \src: control_unit.v:3.27-3.30
	/*input*/ value<1> p_clk;
	value<1> prev_p_clk;
	bool posedge_p_clk() const {
		return !prev_p_clk.slice<0>().val() && p_clk.slice<0>().val();
	}
	// \src: control_unit.v:2.27-2.32
	/*input*/ value<1> p_empty;
	// \src: control_unit.v:1.32-1.37
	/*output*/ value<1> p_flush;
	// \src: control_unit.v:1.56-1.66
	/*output*/ value<1> p_load__words;
	// \src: control_unit.v:2.42-2.44
	/*input*/ value<1> p_m0;
	// \src: control_unit.v:2.34-2.40
	/*input*/ value<1> p_m__is__1;
	// \src: control_unit.v:1.68-1.73
	/*output*/ value<1> p_ready;
	// \src: control_unit.v:3.32-3.37
	/*input*/ value<1> p_reset;
	// \src: control_unit.v:1.39-1.44
	/*output*/ value<1> p_shift;
	// \src: control_unit.v:2.46-2.51
	/*input*/ value<1> p_start;
	// \src: control_unit.v:4.12-4.17
	wire<1> p_state;
	// \src: control_unit.v:4.19-4.29
	/*outline*/ value<1> p_next__state;
	p_control__unit(interior) {}
	p_control__unit() {
		reset();
	};

	void reset() override;
	bool eval() override;
	bool commit() override;

	void debug_eval();
	debug_outline debug_eval_outline { std::bind(&p_control__unit::debug_eval, this) };

	void debug_info(debug_items &items, std::string path = "") override;
}; // struct p_control__unit

void p_control__unit::reset() {
}

bool p_control__unit::eval() {
	bool converged = true;
	bool posedge_p_clk = this->posedge_p_clk();
	// \src: control_unit.v:23.21-23.34
	value<1> i_eq_24_control__unit_2e_v_3a_23_24_4__Y;
	// \src: control_unit.v:26.25-26.38
	value<1> i_eq_24_control__unit_2e_v_3a_26_24_5__Y;
	// \src: control_unit.v:27.29-27.42
	value<1> i_eq_24_control__unit_2e_v_3a_27_24_6__Y;
	// \src: control_unit.v:40.21-40.35
	value<1> i_eq_24_control__unit_2e_v_3a_40_24_7__Y;
	// \src: control_unit.v:45.25-45.35
	value<1> i_eq_24_control__unit_2e_v_3a_45_24_8__Y;
	// connection
	i_eq_24_control__unit_2e_v_3a_27_24_6__Y = p_empty;
	// connection
	i_eq_24_control__unit_2e_v_3a_26_24_5__Y = p_start;
	// connection
	i_eq_24_control__unit_2e_v_3a_23_24_4__Y = p_reset;
	// connection
	i_eq_24_control__unit_2e_v_3a_45_24_8__Y = p_m0;
	// connection
	i_eq_24_control__unit_2e_v_3a_40_24_7__Y = p_m__is__1;
	// cells $procdff$153 $procmux$135 $procmux$137_CMP0 $procmux$36 $procmux$34 $procmux$15 $procmux$13 $procmux$115 $procmux$113 $procmux$91 $procmux$89 $procmux$86 $procmux$58 $procmux$56 $procmux$53 $procmux$51
	if (posedge_p_clk) {
		p_state.next = (p_state.curr ? (p_state.curr ? (i_eq_24_control__unit_2e_v_3a_40_24_7__Y ? value<1>{0u} : (p_state.curr ? (i_eq_24_control__unit_2e_v_3a_40_24_7__Y ? value<1>{0u} : value<1>{0x1u}) : value<1>{0u})) : value<1>{0u}) : (not_u<1>(p_state.curr) ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_26_24_5__Y ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_26_24_5__Y ? (i_eq_24_control__unit_2e_v_3a_27_24_6__Y ? value<1>{0u} : value<1>{0x1u}) : value<1>{0u}))) : value<1>{0u}))))) : value<1>{0u}));
	}
	if (p_reset == value<1> {1u}) {
		p_state.next = value<1>{0u};
	}
	// cells $procmux$138 $procmux$140_CMP0 $procmux$121 $procmux$119
	p_ready = (p_state.curr ? value<1>{0u} : (not_u<1>(p_state.curr) ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : value<1>{0x1u})) : value<1>{0u}));
	// cells $procmux$141 $procmux$143_CMP0 $procmux$127 $procmux$125 $procmux$100 $procmux$98 $procmux$95 $procmux$82 $procmux$80 $procmux$77 $procmux$75
	p_load__words = (p_state.curr ? value<1>{0u} : (not_u<1>(p_state.curr) ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_26_24_5__Y ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_26_24_5__Y ? (i_eq_24_control__unit_2e_v_3a_27_24_6__Y ? value<1>{0u} : value<1>{0x1u}) : value<1>{0u}))) : value<1>{0u}))))) : value<1>{0u}));
	// cells $procmux$147 $procmux$149_CMP0 $procmux$41 $procmux$39 $procmux$23 $procmux$21 $procmux$18
	p_addshift = (p_state.curr ? (p_state.curr ? (i_eq_24_control__unit_2e_v_3a_40_24_7__Y ? value<1>{0x1u} : (p_state.curr ? (i_eq_24_control__unit_2e_v_3a_40_24_7__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_45_24_8__Y ? value<1>{0x1u} : value<1>{0u})) : value<1>{0u})) : value<1>{0u}) : (not_u<1>(p_state.curr) ? value<1>{0u} : value<1>{0u}));
	// cells $procmux$150 $procmux$152_CMP0 $procmux$46 $procmux$44 $procmux$31 $procmux$29 $procmux$26
	p_shift = (p_state.curr ? (p_state.curr ? (i_eq_24_control__unit_2e_v_3a_40_24_7__Y ? value<1>{0u} : (p_state.curr ? (i_eq_24_control__unit_2e_v_3a_40_24_7__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_45_24_8__Y ? value<1>{0u} : value<1>{0x1u})) : value<1>{0u})) : value<1>{0u}) : (not_u<1>(p_state.curr) ? value<1>{0u} : value<1>{0u}));
	// cells $procmux$144 $procmux$146_CMP0 $procmux$133 $procmux$131 $procmux$109 $procmux$107 $procmux$104 $procmux$70 $procmux$68 $procmux$65 $procmux$63
	p_flush = (p_state.curr ? value<1>{0u} : (not_u<1>(p_state.curr) ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_26_24_5__Y ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_26_24_5__Y ? (i_eq_24_control__unit_2e_v_3a_27_24_6__Y ? value<1>{0x1u} : value<1>{0u}) : value<1>{0u}))) : value<1>{0u}))))) : value<1>{0u}));
	return converged;
}

bool p_control__unit::commit() {
	bool changed = false;
	prev_p_clk = p_clk;
	if (p_state.commit()) changed = true;
	return changed;
}

void p_control__unit::debug_eval() {
	// \src: control_unit.v:23.21-23.34
	value<1> i_eq_24_control__unit_2e_v_3a_23_24_4__Y;
	// \src: control_unit.v:26.25-26.38
	value<1> i_eq_24_control__unit_2e_v_3a_26_24_5__Y;
	// \src: control_unit.v:40.21-40.35
	value<1> i_eq_24_control__unit_2e_v_3a_40_24_7__Y;
	// connection
	i_eq_24_control__unit_2e_v_3a_26_24_5__Y = p_start;
	// connection
	i_eq_24_control__unit_2e_v_3a_23_24_4__Y = p_reset;
	// connection
	i_eq_24_control__unit_2e_v_3a_40_24_7__Y = p_m__is__1;
	// cells $procmux$135 $procmux$137_CMP0 $procmux$36 $procmux$34 $procmux$15 $procmux$13 $procmux$115 $procmux$113 $procmux$91 $procmux$89 $procmux$86 $procmux$58 $procmux$56 $procmux$53 $procmux$51
	p_next__state = (p_state.curr ? (p_state.curr ? (i_eq_24_control__unit_2e_v_3a_40_24_7__Y ? value<1>{0u} : (p_state.curr ? (i_eq_24_control__unit_2e_v_3a_40_24_7__Y ? value<1>{0u} : value<1>{0x1u}) : value<1>{0u})) : value<1>{0u}) : (not_u<1>(p_state.curr) ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_26_24_5__Y ? (p_state.curr ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_23_24_4__Y ? value<1>{0u} : (i_eq_24_control__unit_2e_v_3a_26_24_5__Y ? (p_empty ? value<1>{0u} : value<1>{0x1u}) : value<1>{0u}))) : value<1>{0u}))))) : value<1>{0u}));
}

CXXRTL_EXTREMELY_COLD
void p_control__unit::debug_info(debug_items &items, std::string path) {
	assert(path.empty() || path[path.size() - 1] == ' ');
	items.add(path + "addshift", debug_item(p_addshift, 0, debug_item::OUTPUT|debug_item::DRIVEN_COMB));
	items.add(path + "clk", debug_item(p_clk, 0, debug_item::INPUT|debug_item::UNDRIVEN));
	items.add(path + "empty", debug_item(p_empty, 0, debug_item::INPUT|debug_item::UNDRIVEN));
	items.add(path + "flush", debug_item(p_flush, 0, debug_item::OUTPUT|debug_item::DRIVEN_COMB));
	items.add(path + "load_words", debug_item(p_load__words, 0, debug_item::OUTPUT|debug_item::DRIVEN_COMB));
	items.add(path + "m0", debug_item(p_m0, 0, debug_item::INPUT|debug_item::UNDRIVEN));
	items.add(path + "m_is_1", debug_item(p_m__is__1, 0, debug_item::INPUT|debug_item::UNDRIVEN));
	items.add(path + "next_state", debug_item(debug_eval_outline, p_next__state, 0));
	items.add(path + "ready", debug_item(p_ready, 0, debug_item::OUTPUT|debug_item::DRIVEN_COMB));
	items.add(path + "reset", debug_item(p_reset, 0, debug_item::INPUT|debug_item::UNDRIVEN));
	items.add(path + "shift", debug_item(p_shift, 0, debug_item::OUTPUT|debug_item::DRIVEN_COMB));
	items.add(path + "start", debug_item(p_start, 0, debug_item::INPUT|debug_item::UNDRIVEN));
	items.add(path + "state", debug_item(p_state, 0, debug_item::DRIVEN_SYNC));
}

} // namespace cxxrtl_design

extern "C"
cxxrtl_toplevel cxxrtl_design_create() {
	return new _cxxrtl_toplevel { std::unique_ptr<cxxrtl_design::p_control__unit>(new cxxrtl_design::p_control__unit) };
}
