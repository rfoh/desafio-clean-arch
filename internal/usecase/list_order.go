package usecase

import "github.com/rfoh/desafio-clean-arch/internal/entity"

type ListOrderOutputDTO struct {
	Orders []OrderOutputDTO `json:"orders"`
}

type ListOrderUseCase struct {
	OrderRepository entity.OrderRepositoryInterface
}

func NewListOrderUseCase(orderRepository entity.OrderRepositoryInterface) *ListOrderUseCase {
	return &ListOrderUseCase{
		OrderRepository: orderRepository,
	}
}

func (l *ListOrderUseCase) Execute() (ListOrderOutputDTO, error) {
	orders, err := l.OrderRepository.List()
	if err != nil {
		return ListOrderOutputDTO{}, err
	}

	var orderDTOs []OrderOutputDTO
	for _, order := range orders {
		orderDTOs = append(orderDTOs, OrderOutputDTO{
			ID:         order.ID,
			Price:      order.Price,
			Tax:        order.Tax,
			FinalPrice: order.FinalPrice,
		})
	}

	return ListOrderOutputDTO{Orders: orderDTOs}, nil
}
